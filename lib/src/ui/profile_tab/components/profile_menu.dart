import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../routing/app_router.dart';
import '../../../utils/bottom_sheet_util.dart';
import 'delete_user_account_sheet.dart';
import 'help_dropdown.dart';
import 'logout_alert.dart';
import 'profile_item.dart';

class ProfileMenu extends ConsumerStatefulWidget {
  const ProfileMenu({super.key});

  @override
  ConsumerState<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends ConsumerState<ProfileMenu> {
  bool _helpDropDown = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.only(
        // top: 5,
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          ProfileItem(
            title: 'Accounts',
            onTap: () {},
          ),
          const Divider(color: Color(0xFF3B3B3B), height: 8),
          ProfileItem(
            title: 'Booking History',
            onTap: () {
              context.navigateTo(const BookingHistoryRoute());
            },
          ),
          const Divider(color: Color(0xFF3B3B3B), height: 8),
          ProfileItem(
            title: 'Notifications',
            onTap: () {},
          ),
          const Divider(color: Color(0xFF3B3B3B), height: 8),
          ProfileItem(
            title: 'Settings',
            onTap: () {},
          ),
          const Divider(color: Color(0xFF3B3B3B), height: 8),
          ProfileItem(
            title: 'List your Events',
            onTap: () {},
          ),
          const Divider(color: Color(0xFF3B3B3B), height: 8),
          ProfileItem(
            title: 'Referral',
            onTap: () {},
          ),
          const Divider(color: Color(0xFF3B3B3B), height: 8),
          ProfileItem(
            title: 'Help',
            onTap: () {
              _helpDropDown = !_helpDropDown;
              setState(() {});
            },
            iconPath: _helpDropDown
                ? 'assets/dropdown_inverted.png'
                : 'assets/forward_arrow.png',
            height: _helpDropDown ? 10 : 15,
          ),
          if (_helpDropDown) const HelpDropDown(),
          const Divider(color: Color(0xFF3B3B3B), height: 8),
          ProfileItem(
            title: 'Privacy Policy',
            onTap: () {
              context.navigateTo(const PrivacyPolicyRoute());
            },
          ),
          const Divider(color: Color(0xFF3B3B3B), height: 8),
          ProfileItem(
            title: 'Terms and Conditions',
            onTap: () {
              context.navigateTo(const TermsAndConditionsRoute());
            },
          ),
          const Divider(color: Color(0xFF3B3B3B), height: 8),
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
          const Divider(color: Color(0xFF3B3B3B), height: 8),
          ProfileItem(
            title: 'Logout',
            titleTheme: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.red),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => logoutAlert(context, ref),
              );
            },
          ),
        ],
      ),
    );
  }
}
