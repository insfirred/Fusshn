import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fusshn/src/common/dimens.dart';
import 'package:fusshn/src/routing/app_router.dart';

import '../common_widgets/animated_gradient_background.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedGradientBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: homeTabHorizontalPadding,
              ),
              child: Column(
                children: [
                  Text(
                    'Profile',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 35),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Kalash Saini',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/location.png',
                        height: 16,
                        color: const Color(0xFF797979),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Delhi',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
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
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 15,
                                    color: const Color(0xFFC395FF),
                                  ),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/share.png',
                          height: 18,
                          color: const Color(0xFFF55D78),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Share',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 15,
                                    color: const Color(0xFFF55D78),
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  _ProfileItem(
                    title: 'Address Book',
                    subTitle: 'Edit and Add new locations',
                    onTap: () {},
                  ),
                  const Divider(
                    color: Color(0xFF3B3B3B),
                    height: 8,
                  ),
                  _ProfileItem(
                    title: 'Payment and Refunds',
                    subTitle: 'Refund status and payment modes',
                    onTap: () {},
                  ),
                  const Divider(
                    color: Color(0xFF3B3B3B),
                    height: 8,
                  ),
                  _ProfileItem(
                    title: 'Favourites',
                    subTitle: 'All your saved events and venues in one place',
                    onTap: () {},
                  ),
                  const Divider(
                    color: Color(0xFF3B3B3B),
                    height: 8,
                  ),
                  _ProfileItem(
                    title: 'Booking History',
                    subTitle: 'All your past booking in one place History',
                    onTap: () {
                      context.navigateTo(const BookingHistoryRoute());
                    },
                  ),
                  const Divider(
                    color: Color(0xFF3B3B3B),
                    height: 8,
                  ),
                  _ProfileItem(
                    title: 'Settings',
                    subTitle: 'Your app settings',
                    onTap: () {},
                  ),
                  const Divider(
                    color: Color(0xFF3B3B3B),
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  const _ProfileItem({
    required this.title,
    this.subTitle,
    this.onTap,
  });

  final String title;
  final String? subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      titleTextStyle: Theme.of(context).textTheme.bodyMedium,
      subtitle: subTitle != null ? Text(subTitle!) : null,
      subtitleTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFFFFFFF).withOpacity(0.5),
          ),
      trailing: Image.asset(
        'assets/forward_arrow.png',
        height: 15,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
