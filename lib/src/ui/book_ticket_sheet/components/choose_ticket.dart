import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/routing/app_router.dart';
import 'package:fusshn/src/utils/snackbar_utils.dart';

import '../../../common/dimens.dart';
import '../../../models/ticket_type.dart';
import '../../common_widgets/fusshn_btn.dart';
import '../book_ticket_sheet_view_model.dart';

class ChooseTicket extends ConsumerWidget {
  const ChooseTicket({
    super.key,
    required this.tickets,
  });

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
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      width: double.maxFinite,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
                width: 40,
                height: 2,
              )
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
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
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 12,
                                    color: const Color(0xFF808080))),
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
                      if (selectedTicketType.availableTickets <
                          selectedTicketCount) {
                        // CASE where quantity of available tickets are less than selected.
                        Navigator.of(context).pop();
                        showErrorMessage(
                          context,
                          selectedTicketType.availableTickets == 1
                              ? 'Only ${selectedTicketType.availableTickets} ticket is available'
                              : 'Only ${selectedTicketType.availableTickets} tickets are available',
                        );
                      } else {
                        context.navigateTo(const ConfirmBookingRoute());
                      }
                    } else {
                      print('Select Your ticket');
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Ticket extends ConsumerWidget {
  const _Ticket({
    required this.ticket,
  });

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
          color: selectedTicketType == ticket
              ? const Color.fromARGB(255, 32, 136, 53)
              : null,
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
            if (selectedTicketCount > 1) {
              ref
                  .read(bookTicketSheetViewModelProvider.notifier)
                  .setTicketCount(selectedTicketCount - 1);
            } else if (selectedTicketCount == 1) {
              // unselects the current ticket
              log('unselects');

              ref
                  .read(bookTicketSheetViewModelProvider.notifier)
                  .setTicketType(null);
            }

            ref.read(bookTicketSheetViewModelProvider.notifier).setTicketCount(
                selectedTicketCount > 1 ? selectedTicketCount - 1 : 1);
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
