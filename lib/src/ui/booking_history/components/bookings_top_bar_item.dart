import 'package:flutter/material.dart';

class BookingsTopBarItem extends StatelessWidget {
  const BookingsTopBarItem({
    super.key,
    required this.label,
    required this.onTap,
    required this.isSelected,
  });

  final String label;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 170),
          height: 46,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF78F894).withOpacity(0.7) : null,
            border: isSelected
                ? null
                : Border.all(color: const Color(0xFF78F894).withOpacity(0.7)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
