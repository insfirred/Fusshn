import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../common/dimens.dart';
import '../../../models/event_data.dart';
import '../../../models/ticket_type.dart';
import '../../../routing/app_router.dart';
import '../../../utils/snackbar_utils.dart';
import '../../common_widgets/fusshn_btn.dart';
import '../book_ticket_sheet_view_model.dart';

class ChooseTicket extends ConsumerWidget {
  const ChooseTicket({
    super.key,
    required this.tickets,
    required this.event,
  });

  final List<TicketType> tickets;
  final EventData event;

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
          const _DrawerIndicator(),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// Event Info
                        _EventInfo(event),
                        const SizedBox(height: 24),

                        /// Heading
                        Text(
                          'Choose your tickets',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'You can select up to 10 tickets',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 12,
                                  color:
                                      const Color(0xFFFFFFFF).withOpacity(0.5)),
                        ),
                        const Divider(color: Color(0xFF3F3F3F)),
                        const SizedBox(height: 16),

                        /// All tickets
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

                /// Confirm Button
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

class _EventInfo extends StatelessWidget {
  const _EventInfo(this.event);

  final EventData event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: event.posterUrl,
              height: 110,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    event.name,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    DateFormat('d MMMM y, ').add_jm().format(event.startTime),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white.withOpacity(0.5),
                        ),
                  ),
                  Text(
                    event.eventLocation,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white.withOpacity(0.5),
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _DrawerIndicator extends StatelessWidget {
  const _DrawerIndicator();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
          width: 40,
          height: 2,
        ),
      ],
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

    final selectedTicketCount = ref.watch(
      bookTicketSheetViewModelProvider.select((_) => _.selectedTicketCount),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticket.name,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\u20B9 ${ticket.price.ceil()} | ',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 12),
                      ),
                      TextSpan(
                        text: 'Available',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Add Button and Counter
            if (selectedTicketType == ticket) ...[
              const _Counter(),
            ] else
              GestureDetector(
                onTap: () {
                  ref
                      .read(bookTicketSheetViewModelProvider.notifier)
                      .setTicketType(
                          selectedTicketType != ticket ? ticket : null);
                },
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: selectedTicketType != ticket
                        ? const Text('Add +')
                        : Text(selectedTicketCount.toString()),
                  ),
                ),
              ),
          ],
        ),
        Text(
          ticket.description,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: const Color(0xFFFFFFFF).withOpacity(0.5), fontSize: 12),
        ),
        const SizedBox(height: 24),
      ],
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

    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              if (selectedTicketCount > 1) {
                ref
                    .read(bookTicketSheetViewModelProvider.notifier)
                    .setTicketCount(selectedTicketCount - 1);
              } else if (selectedTicketCount == 1) {
                ref
                    .read(bookTicketSheetViewModelProvider.notifier)
                    .setTicketType(null);
              }

              ref
                  .read(bookTicketSheetViewModelProvider.notifier)
                  .setTicketCount(
                      selectedTicketCount > 1 ? selectedTicketCount - 1 : 1);
            },
            child: SvgPicture.asset(
              'assets/remove.svg',
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            selectedTicketCount.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              // condition so that user cannot select more than 10 tickets.
              if (selectedTicketCount >= 10) return;

              ref
                  .read(bookTicketSheetViewModelProvider.notifier)
                  .setTicketCount(selectedTicketCount + 1);
            },
            child: SvgPicture.asset(
              'assets/add.svg',
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
