import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/repositories/app_repository.dart';
import 'package:fusshn/src/ui/common_widgets/fusshn_btn.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../common/dimens.dart';
import '../../models/booking.dart';
import '../../models/event_data.dart';
import '../common_widgets/fusshn_appbar.dart';

@RoutePage()
class TicketView extends StatelessWidget {
  const TicketView({
    super.key,
    required this.eventData,
    required this.booking,
  });

  final EventData eventData;
  final Booking booking;

  @override
  Widget build(BuildContext context) {
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
                children: [
                  const FusshnAppBar(label: 'Ticket Details'),
                  const SizedBox(height: 20),

                  // Event Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: eventData.imagesUrls.first,
                    ),
                  ),
                  const SizedBox(height: 19),

                  // Event Name And QR
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              eventData.name,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              '${booking.ticketType.name} x ${booking.ticketCount}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 40),

                      // QR Code
                      QrImageView(
                        data: booking.id,
                        version: QrVersions.auto,
                        backgroundColor: Colors.white,
                        size: 150,
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
                    ],
                  ),
                  const SizedBox(height: 19),

                  // Timing and Venue
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/calender.png',
                              width: 14,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Date',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    '${DateFormat('d MMM y,').add_jm().format(eventData.startTime)} - ${DateFormat.jm().format(eventData.endTime)}',
                                    overflow: TextOverflow.visible,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/location.png',
                              width: 14,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Venue',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    eventData.eventLocation,
                                    overflow: TextOverflow.visible,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    softWrap: true,
                                  ),
                                  const SizedBox(height: 12),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: const Color(0xFF78F894)
                                            .withOpacity(0.7),
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 17,
                                      vertical: 12,
                                    ),
                                    child: Text(
                                      'Get Directions',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF78F894)
                                            .withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 19),

                  // TicketType
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/location.png',
                        width: 14,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ticket',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${booking.ticketType.name} x ${booking.ticketCount}',
                              overflow: TextOverflow.visible,
                              style: Theme.of(context).textTheme.bodySmall,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 19),

                  // Contact Details
                  const _UserContact(),
                  const SizedBox(height: 80),
                ],
              ),
            ),

            // Download Tickket Btn
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FusshnBtn(
                  onTap: () {},
                  height: 43,
                  label: 'Download Ticket',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserContact extends ConsumerWidget {
  const _UserContact();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(
      appRepositoryProvider.select((_) => _.userData),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/location.png',
          width: 14,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Details',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              // const SizedBox(height: 8),
              Text(
                userData!.email,
                overflow: TextOverflow.visible,
                style: Theme.of(context).textTheme.bodySmall,
                softWrap: true,
              ),
              if (userData.phone != null) ...[
                Text(
                  userData.phone ?? '',
                  overflow: TextOverflow.visible,
                  style: Theme.of(context).textTheme.bodySmall,
                  softWrap: true,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
