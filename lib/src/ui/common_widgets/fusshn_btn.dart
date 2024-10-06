import 'package:flutter/material.dart';

import '../../common/dimens.dart';

class FusshnBtn extends StatelessWidget {
  const FusshnBtn({
    super.key,
    this.onTap,
    required this.label,
    this.height,
    this.width,
  });

  final void Function()? onTap;
  final String label;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: height,
              width: width ??
                  MediaQuery.of(context).size.width -
                      2 * homeTabHorizontalPadding,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
