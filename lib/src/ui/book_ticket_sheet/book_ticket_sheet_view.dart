import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/ticket_type.dart';
import 'book_ticket_sheet_view_model.dart';
import 'components/choose_ticket.dart';

class BookTicketSheet extends ConsumerStatefulWidget {
  const BookTicketSheet({
    required this.tickets,
    required this.eventId,
    super.key,
  });

  final List<TicketType> tickets;
  final String eventId;

  @override
  ConsumerState<BookTicketSheet> createState() => _BookTicketSheetState();
}

class _BookTicketSheetState extends ConsumerState<BookTicketSheet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref
          .read(bookTicketSheetViewModelProvider.notifier)
          .setEventId(widget.eventId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.95,
      builder: (context, scrollController) => ChooseTicket(
        tickets: widget.tickets,
      ),
    );
  }
}
