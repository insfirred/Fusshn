import 'package:flutter/material.dart';

import '../../../models/ticket_type.dart';
import '../../../utils/bottom_sheet_util.dart';
import '../../book_ticket_sheet/book_ticket_sheet_view.dart';
import '../../common_widgets/fusshn_btn.dart';

class BookTicketsBtn extends StatelessWidget {
  const BookTicketsBtn({
    super.key,
    required this.tickets,
    required this.eventId,
  });

  final List<TicketType> tickets;
  final String eventId;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      child: FusshnBtn(
        label: 'Book Tickets',
        onTap: () {
          showFusshnBottomSheet(
            context: context,
            builder: (context) => BookTicketSheet(
              tickets: tickets,
              eventId: eventId,
            ),
          );
        },
      ),
    );
  }
}
