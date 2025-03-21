import 'package:auto_route/auto_route.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../routing/app_router.dart';
import 'help_dropdown.dart';
import 'logout_alert.dart';
import 'profile_item.dart';

class ProfileMenu extends ConsumerStatefulWidget {
  const ProfileMenu({super.key});

  @override
  ConsumerState<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends ConsumerState<ProfileMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ProfileItem(
            title: 'Booking History',
            onTap: () {
              context.navigateTo(const BookingHistoryRoute());
            },
          ),
          const Divider(color: Color(0xFF3B3B3B), height: 8),
          ProfileItem(
            title: 'Referral',
            onTap: () {
              context.navigateTo(const ReferralRoute());
            },
          ),
          const Divider(color: Color(0xFF3B3B3B), height: 8),
          ExpansionTileCard(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            shadowColor: Colors.transparent,
            title: Text(
              'Help',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: const Color(0xFFF1F1F1),
                    fontSize: 17,
                  ),
            ),
            baseColor: const Color(0xFF1E1E1E),
            expandedColor: const Color(0xFF1E1E1E),
            trailing: Image.asset(
              'assets/forward_arrow.png',
              height: 15,
            ),
            children: const [
              HelpDropDown(),
            ],
          ),
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
