import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fusshn/src/routing/app_router.dart';

import '../../../utils/bottom_sheet_util.dart';
import 'delete_user_account_sheet.dart';
import 'profile_item.dart';

class HelpDropDown extends StatelessWidget {
  const HelpDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        children: [
          ProfileItem(
            onTap: () {
              context.navigateTo(const ContactUsRoute());
            },
            title: 'Contact Us',
          ),
          ProfileItem(
            onTap: () {
              context.navigateTo(const SendFeedbackRoute());
            },
            title: 'Send Feedback',
          ),
          ProfileItem(
            title: 'Delete your account',
            titleTheme: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.red),
            onTap: () {
              showFusshnBottomSheet(
                context: context,
                builder: (context) => const DeleteUserAccountSheet(),
              );
            },
          ),
        ],
      ),
    );
  }
}
