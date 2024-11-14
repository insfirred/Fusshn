import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/ui/home_tab/home_view_model.dart';

import '../../common/dimens.dart';
import '../../common/strings.dart';
import '../../utils/snackbar_utils.dart';
import '../common_widgets/fusshn_appbar.dart';
import '../common_widgets/fusshn_btn.dart';
import 'confirm_booking_view_model.dart';

@RoutePage()
class ConfirmBookingView extends ConsumerWidget {
  const ConfirmBookingView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      confirmBookingViewModelProvider,
      (previous, next) async {
        if (next.status == PaymentStatus.failure) {
          showErrorMessage(context, next.errorMessage ?? 'Payment Failed');
        } else if (next.status == PaymentStatus.success) {
          context.router.popUntilRoot();
          ref.read(homeViewModelProvider.notifier).showPaymentSuccessPopup();
        }
      },
    );

    final paymentStatus = ref.watch(
      confirmBookingViewModelProvider.select((_) => _.status),
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: homeTabHorizontalPadding,
              ),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FusshnAppBar(label: 'Confirm Booking'),
                  const SizedBox(height: 10),
                  const _ImportantNoteBox(),
                  const SizedBox(height: 15),
                  const _BillSummary(),
                  const SizedBox(height: 18),
                  const Divider(color: Color(0xFF999999)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Got Code?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Image.asset(
                        'assets/lock.png',
                        width: 15,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Color(0xFF999999)),
                  const _TermsConditionsBox(),
                  const SizedBox(height: 15),
                  const _CompletePaymentBtn(),
                ],
              ),
            ),
            if (paymentStatus == PaymentStatus.loading) ...[
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 3,
                  sigmaY: 3,
                ),
                child: Center(
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText('Confirming your payment ...'),
                      ],
                      repeatForever: true,
                      isRepeatingAnimation: true,
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ImportantNoteBox extends StatelessWidget {
  const _ImportantNoteBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFFFFFFF).withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF1A1A1A).withOpacity(0.5),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Important Note',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Divider(color: Color(0xFF78F894)),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: importantNotes.length,
            itemBuilder: (context, index) => _ImpNoteItem(
              importantNotes[index],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImpNoteItem extends StatelessWidget {
  const _ImpNoteItem(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '•',
              style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
            ),
          ),
          Expanded(
            flex: 20,
            child: Text(
              label,
              style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class _TermsConditionsBox extends ConsumerWidget {
  const _TermsConditionsBox();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTermsAccepted = ref.watch(
      confirmBookingViewModelProvider.select((_) => _.isTermsAccepted),
    );

    return Row(
      children: [
        Checkbox(
          value: isTermsAccepted,
          onChanged: (val) {
            ref
                .read(confirmBookingViewModelProvider.notifier)
                .setIsTermsAccepted(!isTermsAccepted);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          side: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        Expanded(
          child: Text(
            'I have read and accepted the terms and conditions',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

class _CompletePaymentBtn extends ConsumerWidget {
  const _CompletePaymentBtn();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FusshnBtn(
      label: 'Proceed to Payment',
      onTap: () {
        ref.read(confirmBookingViewModelProvider.notifier).openCheckout();
      },
    );
  }
}

class _BillSummary extends ConsumerWidget {
  const _BillSummary();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketType = ref.watch(
      confirmBookingViewModelProvider.select((_) => _.selectedTicketType),
    );
    final ticketCount = ref.watch(
      confirmBookingViewModelProvider.select((_) => _.selectedTicketCount),
    );

    final basePrice = ref.watch(
      confirmBookingViewModelProvider.select((_) => _.basePrice),
    );

    final gstFee = ref.watch(
      confirmBookingViewModelProvider.select((_) => _.gstFee),
    );

    final bookingFee = ref.watch(
      confirmBookingViewModelProvider.select((_) => _.bookingFee),
    );

    final grandTotalPrice = ref.watch(
      confirmBookingViewModelProvider.select((_) => _.grandTotalPrice),
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF797979).withOpacity(0.4)),
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(120, 248, 148, 0),
            Color.fromRGBO(67, 67, 67, 0.45),
            Color.fromRGBO(48, 48, 48, 0),
          ],
          stops: [0.01, 0.80, 1.0],
          transform: GradientRotation(
            61.07 * (3.1415927 / 180),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bill Summary',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 24,
                ),
          ),
          const Divider(color: Color(0xFF999999)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ticketType?.name ?? '',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '\u20B9 ${ticketType?.price} X $ticketCount',
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
          const Divider(color: Color(0xFF999999)),

          /// DISCOUNT Value
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'Discount',
          //       style: Theme.of(context).textTheme.bodySmall,
          //     ),
          //     Text(
          //       '\u20B9 $bookingFee',
          //       style: Theme.of(context).textTheme.bodySmall,
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 5),
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
          const SizedBox(height: 5),
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
                'Grand Total',
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
