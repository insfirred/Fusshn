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
    return Material(
      color: Colors.transparent,
      child: ListTile(
        splashColor: ThemeData().splashColor,
        onTap: onTap,
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFFF1F1F1),
                  fontSize: 17,
                ),
          ),
        ),
        titleTextStyle: titleTheme ?? Theme.of(context).textTheme.bodyMedium,
        trailing: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Image.asset(
            iconPath,
            height: height,
          ),
        ),
        contentPadding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
