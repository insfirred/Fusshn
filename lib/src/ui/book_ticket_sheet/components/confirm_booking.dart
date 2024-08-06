import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/utils/snackbar_utils.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../common/dimens.dart';
import '../../common_widgets/fusshn_btn.dart';
import '../book_ticket_sheet_view_model.dart';

class ConfirmBooking extends ConsumerWidget {
  const ConfirmBooking({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      bookTicketSheetViewModelProvider,
      (previous, next) {
        if (next.status == PaymentStatus.failure) {
          print("Payment Failed");
          showErrorMessage(context, "Payment Failed");
        } else if (next.status == PaymentStatus.success) {
          Navigator.pop(context);
          showSuccessMessage(context, "Payment Successfull");
        }
      },
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: homeTabHorizontalPadding,
        vertical: 22,
      ),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: Color.fromARGB(255, 43, 43, 43)),
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeIn,
                );
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
            const SizedBox(height: 15),
            Text(
              'Confirm Booking',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 2),
            Text(
                'Add information for smooth access at the time of entry. Don\'t worry, you can change these names later.',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 12, color: const Color(0xFF808080))),
            const Divider(color: Color(0xFF3F3F3F)),
            const SizedBox(height: 32),
            const _BillSummary(),
            const SizedBox(height: 20),
            const _CompletePaymentBtn()
          ],
        ),
      ),
    );
  }
}

class _CompletePaymentBtn extends ConsumerStatefulWidget {
  const _CompletePaymentBtn();

  @override
  ConsumerState<_CompletePaymentBtn> createState() =>
      _CompletePaymentBtnState();
}

class _CompletePaymentBtnState extends ConsumerState<_CompletePaymentBtn> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();

    _razorpay = Razorpay();

    // listening razorpay payments events
    _razorpay.on(
        Razorpay.EVENT_PAYMENT_ERROR,
        ref
            .read(bookTicketSheetViewModelProvider.notifier)
            .handlePaymentErrorResponse);

    _razorpay.on(
        Razorpay.EVENT_PAYMENT_SUCCESS,
        ref
            .read(bookTicketSheetViewModelProvider.notifier)
            .handlePaymentSuccessResponse);

    _razorpay.on(
        Razorpay.EVENT_EXTERNAL_WALLET,
        ref
            .read(bookTicketSheetViewModelProvider.notifier)
            .handleExternalWalletSelected);
  }

  @override
  Widget build(BuildContext context) {
    return FusshnBtn(
      label: 'Complete Payment',
      onTap: () {
        var options = {
          'key': 'rzp_test_v7vt4lUfa6mXMK',
          'amount':
              ref.read(bookTicketSheetViewModelProvider).grandTotalPrice * 100,
          'name': 'Kalash',
          'description': ref
              .read(bookTicketSheetViewModelProvider)
              .selectedTicketType!
              .description,
          'retry': {'enabled': true, 'max_count': 1},
          'send_sms_hash': true,
          'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
          'external': {
            'wallets': ['paytm']
          }
        };

        print(
          'AMOUNT: ${ref.read(bookTicketSheetViewModelProvider).grandTotalPrice * 100}',
        );

        print(
          'DESC: ${ref.read(bookTicketSheetViewModelProvider).selectedTicketType!.description}',
        );

        // opening a transaction
        _razorpay.open(options);
      },
    );
  }
}

class _BillSummary extends ConsumerWidget {
  const _BillSummary();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketType = ref.watch(
      bookTicketSheetViewModelProvider.select((_) => _.selectedTicketType),
    );
    final ticketCount = ref.watch(
      bookTicketSheetViewModelProvider.select((_) => _.selectedTicketCount),
    );

    final basePrice = ref.watch(
      bookTicketSheetViewModelProvider.select((_) => _.basePrice),
    );

    final gstFee = ref.watch(
      bookTicketSheetViewModelProvider.select((_) => _.gstFee),
    );

    final bookingFee = ref.watch(
      bookTicketSheetViewModelProvider.select((_) => _.bookingFee),
    );

    final grandTotalPrice = ref.watch(
      bookTicketSheetViewModelProvider.select((_) => _.grandTotalPrice),
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 75, 75, 75),
        border: Border.all(color: const Color(0xFF4E60EC)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bill Summary',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Divider(color: Color(0xFF999999)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ticketType!.name,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    ticketCount == 1
                        ? '$ticketCount Ticket'
                        : '$ticketCount Tickets',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Text(
                '\u20B9 $basePrice',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Booking fee',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '\u20B9 $bookingFee',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'GST (18%)',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '\u20B9 $gstFee',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const Divider(color: Color(0xFF999999)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TOTAL',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '\u20B9 $grandTotalPrice',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
