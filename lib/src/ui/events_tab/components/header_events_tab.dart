import 'package:flutter/material.dart';

class HeaderEventsTab extends StatelessWidget {
  const HeaderEventsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/images/header_events.jpg',
          fit: BoxFit.fitWidth,
        ),
      ),
      collapsedHeight: 146,
      toolbarHeight: 146,
      backgroundColor: Colors.transparent,
      // flexibleSpace: Image.asset(
      //   'assets/images/header_events.jpg',
      //   fit: BoxFit.fitWidth,
      // ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 20),
          child: Image.asset(
            'assets/notification_read.png',
            width: 24,
          ),
        )
      ],
      title: Text(
        'Explore Events',
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
