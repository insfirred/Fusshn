import 'package:flutter/material.dart';

class EventsTabBanner extends StatelessWidget {
  const EventsTabBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/test/event2.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
