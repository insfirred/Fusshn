import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../models/booking.dart';
import '../../../routing/app_router.dart';
import '../booking_history_view_model.dart';

class BookingItem extends ConsumerWidget {
  const BookingItem(
    this.booking, {
    super.key,
  });

  final Booking booking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(
      bookingHistoryViewModelProvider.select((_) => _.eventData),
    )?[booking.id];

    log(booking.id);

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
          height: booking.isCheckIn ? 160 : 182,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            // vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
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
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${DateFormat('d MMM y,').add_jm().format(event!.startTime)} - ${DateFormat.jm().format(event.endTime)}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '${booking.ticketType.name} x ${booking.ticketCount}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (!booking.isCheckIn) ...[
                const Spacer(),
                const Text(
                  'FINISHED: Hope you enjoyed the show',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5)
              ],
            ],
          )),
    );
  }
}
