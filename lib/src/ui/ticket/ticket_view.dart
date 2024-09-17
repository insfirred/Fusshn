import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'components/ticket_clipper.dart';

@RoutePage()
class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ClipPath(
            clipper: TicketClipper(),
            child: Container(
              width: 200,
              height: 500,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
