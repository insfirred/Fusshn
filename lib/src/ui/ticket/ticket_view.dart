import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/dimens.dart';
import '../../models/booking.dart';
import '../../models/event_data.dart';
import '../../repositories/app_repository.dart';
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
      body: Column(
        children: [
          const FusshnAppBar(label: 'Ticket Details'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: homeTabHorizontalPadding,
              ),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Event Image With QR Widget
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: eventData.imagesUrls.first,
                          height: 240,
                        ),
                      ),

                      // QR Code
                      Padding(
                        padding: const EdgeInsets.only(top: 165),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: QrImageView(
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
                            padding: const EdgeInsets.all(4),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Event Name
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 9,
                        child: Text(
                          eventData.name,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 19),

                  // Date / Time
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/calender.png',
                              width: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Date',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFFF1F1F1),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    DateFormat('d MMM y')
                                        .format(eventData.startTime),
                                    overflow: TextOverflow.visible,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/location.png',
                              width: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Time',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFFF1F1F1),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    DateFormat.jm().format(eventData.endTime),
                                    overflow: TextOverflow.visible,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    softWrap: true,
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

                  // Venue
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/location.png',
                        width: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Venue',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFF1F1F1),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              eventData.eventLocation,
                              overflow: TextOverflow.visible,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              softWrap: true,
                            ),
                            const SizedBox(height: 8),
                            const _GetDirectionBtn(),
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
                      SvgPicture.asset(
                        'assets/ticket.svg',
                        color: Colors.white,
                        width: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ticket',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFF1F1F1),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${booking.ticketType.name} x ${booking.ticketCount}',
                              overflow: TextOverflow.visible,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
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
          ),
        ],
      ),
    );
  }
}

class _GetDirectionBtn extends StatelessWidget {
  const _GetDirectionBtn();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!await launchUrl(Uri.parse(
            'https://www.google.com/maps/@28.396366244820598,77.10404872451666,15z'))) {
          throw Exception('Something went wrong on launching map url...');
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF78F894).withOpacity(0.7),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 12,
        ),
        child: Text(
          'Get Directions',
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF78F894).withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}

// Download Tickket Btn
// Padding(
//   padding: const EdgeInsets.only(bottom: 30),
//   child: Align(
//     alignment: Alignment.bottomCenter,
//     child: FusshnBtn(
//       onTap: () {},
//       height: 43,
//       label: 'Download Ticket',
//     ),
//   ),
// ),

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
        SvgPicture.asset(
          'assets/mail.svg',
          color: Colors.white,
          width: 20,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Details',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFF1F1F1),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                userData!.email,
                overflow: TextOverflow.visible,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
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
