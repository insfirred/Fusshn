import 'package:flutter/material.dart';

class GreetingAppBar extends StatelessWidget {
  const GreetingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 85,
      toolbarHeight: 85,
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 20),
          child: Image.asset(
            'assets/notification_read.png',
            width: 24,
          ),
        )
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 34),
          Text(
            "Hi Garvit",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                "Delhi NCR",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(width: 6),
              Image.asset(
                'assets/dropdown.png',
                width: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
