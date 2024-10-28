import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../routing/app_router.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateTo(const EditProfileRoute());
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Image.asset(
            'assets/edit.png',
            height: 18,
            color: const Color(0xFFC395FF),
          ),
          const SizedBox(width: 5),
          Text(
            'Edit',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 15,
                  color: const Color(0xFFC395FF),
                ),
          ),
        ],
      ),
    );
  }
}
