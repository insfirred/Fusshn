import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class FusshnAppBar extends StatelessWidget {
  const FusshnAppBar({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.maybePop();
            },
            behavior: HitTestBehavior.opaque,
            child: Image.asset(
              'assets/back.png',
              width: 25,
            ),
          ),
          const Spacer(),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Spacer(),
          const SizedBox(width: 25),
        ],
      ),
    );
  }
}
