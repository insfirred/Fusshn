import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/ui/book_ticket_sheet/book_ticket_sheet_view_model.dart';
import 'package:fusshn/src/ui/common_widgets/fusshn_btn.dart';
import 'package:fusshn/src/utils/snackbar_utils.dart';

import '../../../common/dimens.dart';
import '../../../models/ticket_type.dart';

class ChooseTicket extends ConsumerWidget {
  const ChooseTicket({
    super.key,
    required this.pageController,
    required this.tickets,
  });

  final PageController pageController;
  final List<TicketType> tickets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTicketType = ref.watch(
      bookTicketSheetViewModelProvider.select((_) => _.selectedTicketType),
    );
    final selectedTicketCount = ref.watch(
      bookTicketSheetViewModelProvider.select((_) => _.selectedTicketCount),
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
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Choose your tickets',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 2),
                  Text(
                      'View all ticket options available. Click once to select and add how many you want to buy.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 12, color: const Color(0xFF808080))),
                  const Divider(color: Color(0xFF3F3F3F)),
                  const SizedBox(height: 16),
                  Column(
                    children: tickets
                        .map(
                          (ticket) => _Ticket(ticket: ticket),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          FusshnBtn(
            label: 'Confirm',
            onTap: () {
              if (selectedTicketType != null && selectedTicketCount > 0) {
                ref
                    .read(bookTicketSheetViewModelProvider.notifier)
                    .calculateTotalPrice();

                pageController.nextPage(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeIn,
                );
              } else {
                print('Select Your ticket');
              }
            },
          )
        ],
      ),
    );
  }
}

class _Ticket extends ConsumerWidget {
  const _Ticket({
    // required this.pageController,
    required this.ticket,
  });

  // final PageController pageController;
  final TicketType ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTicketType = ref.watch(
      bookTicketSheetViewModelProvider.select((_) => _.selectedTicketType),
    );

    return GestureDetector(
      onTap: () {
        ref
            .read(bookTicketSheetViewModelProvider.notifier)
            .setTicketType(selectedTicketType != ticket ? ticket : null);
      },
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFFAFAFA).withOpacity(0.5),
          ),
          color: selectedTicketType == ticket ? Colors.pink : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ticket.name,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 4),
            Text(
              ticket.description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: const Color(0xFFFFFFFF).withOpacity(0.5),
                  fontSize: 12),
            ),
            const Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\u20B9 ${ticket.price.ceil()}',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ticket.isRefundable ? 'Refundable' : 'Non Refundable',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFFFFFFFF).withOpacity(0.5),
                          fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                if (selectedTicketType == ticket) ...[
                  const _Counter(),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Counter extends ConsumerWidget {
  const _Counter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTicketCount = ref.watch(
      bookTicketSheetViewModelProvider.select((_) => _.selectedTicketCount),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            ref.read(bookTicketSheetViewModelProvider.notifier).setTicketCount(
                selectedTicketCount > 0 ? selectedTicketCount - 1 : 0);
          },
          style: TextButton.styleFrom(backgroundColor: Colors.grey),
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 8),
        Text(
          selectedTicketCount.toString(),
          style:
              Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 18),
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {
            ref
                .read(bookTicketSheetViewModelProvider.notifier)
                .setTicketCount(selectedTicketCount + 1);
          },
          style: TextButton.styleFrom(backgroundColor: Colors.grey),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
