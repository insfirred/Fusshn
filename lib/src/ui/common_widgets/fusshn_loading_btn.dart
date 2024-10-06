import 'package:flutter/material.dart';

import '../../common/dimens.dart';

class FusshnLoadingBtn extends StatelessWidget {
  const FusshnLoadingBtn({
    super.key,
    this.height,
    this.width,
  });

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
          child: Container(
            height: height,
            width: width ??
                MediaQuery.of(context).size.width -
                    2 * homeTabHorizontalPadding,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
