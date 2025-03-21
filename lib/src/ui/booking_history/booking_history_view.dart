import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/dimens.dart';
import '../common_widgets/fusshn_appbar.dart';
import 'booking_history_view_model.dart';
import 'components/booking_item.dart';
import 'components/bookings_top_bar_item.dart';

@RoutePage()
class BookingHistoryView extends ConsumerWidget {
  const BookingHistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upcomingBookings = ref.watch(
      bookingHistoryViewModelProvider.select((_) => _.upcomingBookings),
    );

    final pastBookings = ref.watch(
      bookingHistoryViewModelProvider.select((_) => _.pastBookings),
    );

    final status = ref.watch(
      bookingHistoryViewModelProvider.select((_) => _.status),
    );

    final viewType = ref.watch(
      bookingHistoryViewModelProvider.select((_) => _.viewType),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: homeTabHorizontalPadding,
          ),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const FusshnAppBar(label: 'My Booking'),
              const SizedBox(height: 35),
              status == BookingHistoryViewStatus.loading
                  ? const CircularProgressIndicator()
                  : status == BookingHistoryViewStatus.error
                      ? const Text('Error while fetchiing booking')
                      : Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  BookingsTopBarItem(
                                    label: 'Upcoming',
                                    onTap: () {
                                      ref
                                          .read(bookingHistoryViewModelProvider
                                              .notifier)
                                          .setViewType(
                                              BookingHistoryViewType.UPCOMING);
                                    },
                                    isSelected: viewType ==
                                        BookingHistoryViewType.UPCOMING,
                                  ),
                                  const SizedBox(width: 12),
                                  BookingsTopBarItem(
                                    label: 'Past Events',
                                    onTap: () {
                                      ref
                                          .read(bookingHistoryViewModelProvider
                                              .notifier)
                                          .setViewType(BookingHistoryViewType
                                              .PAST_EVENTS);
                                    },
                                    isSelected: viewType ==
                                        BookingHistoryViewType.PAST_EVENTS,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 21),
                            viewType == BookingHistoryViewType.UPCOMING
                                ? upcomingBookings.isNotEmpty
                                    ? ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: upcomingBookings.length,
                                        itemBuilder: (context, index) =>
                                            BookingItem(
                                                upcomingBookings[index]),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(height: 17),
                                      )
                                    : Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 250,
                                          ),
                                          child: Text(
                                            'Looks like you dont have any Upcoming Events :(',
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      )
                                : pastBookings.isNotEmpty
                                    ? ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: pastBookings.length,
                                        itemBuilder: (context, index) =>
                                            BookingItem(pastBookings[index]),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(height: 17),
                                      )
                                    : Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 250,
                                          ),
                                          child: Text(
                                            'Looks like you dont have any Past Events :(',
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                          ],
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
