import 'package:flutter/material.dart';

import '../../models/ticket_type.dart';
import 'components/confirm_booking.dart';
import 'components/choose_ticket.dart';

class BookTicketSheet extends StatefulWidget {
  const BookTicketSheet({
    required this.tickets,
    super.key,
  });

  final List<TicketType> tickets;

  @override
  State<BookTicketSheet> createState() => _BookTicketSheetState();
}

class _BookTicketSheetState extends State<BookTicketSheet> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ChooseTicket(
          pageController: pageController,
          tickets: widget.tickets,
        ),
        ConfirmBooking(pageController: pageController),
      ],
    );
  }
}
