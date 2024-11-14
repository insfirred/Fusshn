import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    this.titleTheme,
    this.onTap,
    this.iconPath = 'assets/forward_arrow.png',
    this.height = 15,
  });

  final String title;
  final TextStyle? titleTheme;
  final void Function()? onTap;
  final String iconPath;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      titleTextStyle: titleTheme ?? Theme.of(context).textTheme.bodyMedium,
      trailing: Image.asset(
        iconPath,
        height: height,
      ),
      contentPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
