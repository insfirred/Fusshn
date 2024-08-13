import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../common/dimens.dart';
import '../../models/booking.dart';
import 'booking_history_view_model.dart';

@RoutePage()
class BookingHistoryView extends ConsumerWidget {
  const BookingHistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myBooking = ref.watch(
      bookingHistoryViewModelProvider.select((_) => _.myBookings),
    );

    final status = ref.watch(
      bookingHistoryViewModelProvider.select((_) => _.status),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: homeTabHorizontalPadding,
            ),
            child: Column(
              children: [
                Text(
                  'My Bookings History',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 35),
                status == BookingHistoryViewStatus.loading
                    ? const CircularProgressIndicator()
                    : status == BookingHistoryViewStatus.error
                        ? const Text('Error while fetchiing booking')
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                myBooking.map((e) => _BookingItem(e)).toList(),
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BookingItem extends ConsumerWidget {
  const _BookingItem(this.booking);

  final Booking booking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(
      bookingHistoryViewModelProvider.select((_) => _.eventData),
    )?[booking.id];

    return Container(
      decoration: BoxDecoration(
        // color: Colors.grey,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Booked on ${DateFormat('d MMM y').add_jm().format(booking.createdAt)}',
          ),
          event != null
              ? Text(
                  event.name,
                )
              : const Text('error fetching event'),
          Text(
            '${booking.ticketCount} X ${booking.ticketType.name}',
          ),
        ],
      ),
    );
  }
}
