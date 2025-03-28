import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../models/booking.dart';
import '../../../routing/app_router.dart';
import '../booking_history_view_model.dart';

class BookingItem extends ConsumerWidget {
  const BookingItem({
    super.key,
    required this.booking,
    required this.isPastEvent,
  });

  final Booking booking;
  final bool isPastEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(
      bookingHistoryViewModelProvider.select((_) => _.eventData),
    )?[booking.id];

    return GestureDetector(
      onTap: () {
        context.navigateTo(
          TicketRoute(
            eventData: event,
            booking: booking,
          ),
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: isPastEvent ? 182 : 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: QrImageView(
                      data: booking.id,
                      version: QrVersions.auto,
                      backgroundColor: Colors.white,
                      eyeStyle: const QrEyeStyle(
                        color: Colors.black,
                        eyeShape: QrEyeShape.square,
                      ),
                      dataModuleStyle: const QrDataModuleStyle(
                        color: Colors.black,
                      ),
                      gapless: false,
                      semanticsLabel: 'BookingID',
                    ),
                  ),
                  const SizedBox(width: 17),
                  SvgPicture.asset('assets/vertical_divider.svg'),
                  const SizedBox(width: 17),
                  Expanded(
                    flex: 12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event?.name ?? "Unknown",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${DateFormat('d MMM y,').add_jm().format(event!.startTime)} - ${DateFormat.jm().format(event.endTime)}',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '${booking.ticketType.name} x ${booking.ticketCount}',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 12),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Booking - ',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: booking.id,
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (isPastEvent) ...[
              Flexible(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: Color.fromARGB(255, 198, 198, 198),
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            booking.isCheckIn
                                ? 'Event Finished: Hope you enjoyed the show'
                                : 'Event Finished: Did not attend',
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5)
                    ],
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
