import 'package:flutter/material.dart';

class HeadingWithDivider extends StatelessWidget {
  const HeadingWithDivider(
    this.label, {
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
        ),
        const SizedBox(width: 8),
        const Expanded(child: Divider(color: Color(0xFF3B3B3B))),
      ],
    );
  }
}
