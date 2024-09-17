import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/common/dimens.dart';
import 'package:fusshn/src/repositories/app_repository.dart';
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
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: homeTabHorizontalPadding,
              ),
              child: Column(
                children: [
                  const _UserDetails(),
                  const _ProfileMenu(),
                  const SizedBox(height: 30),
                  Text(
                    'Build by Kalash and Garvit with ❣️',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _UserDetails extends ConsumerWidget {
  const _UserDetails();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name =
        ref.watch(appRepositoryProvider.select((_) => _.userData!.name));
    final email =
        ref.watch(appRepositoryProvider.select((_) => _.userData!.email));

    return Column(
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
        Column(
          children: [
            Text(
              name ?? 'username',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              email,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _EditButton(),
              ],
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

class _EditButton extends StatelessWidget {
  const _EditButton();

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

class _ProfileMenu extends ConsumerStatefulWidget {
  const _ProfileMenu();

  @override
  ConsumerState<_ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends ConsumerState<_ProfileMenu> {
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
          _ProfileItem(
            title: 'Accounts',
            onTap: () {},
          ),
          const Divider(
            color: Color(0xFF3B3B3B),
            height: 8,
          ),
          _ProfileItem(
            title: 'Booking History',
            onTap: () {
              context.navigateTo(const BookingHistoryRoute());
            },
          ),
          const Divider(
            color: Color(0xFF3B3B3B),
            height: 8,
          ),
          _ProfileItem(
            title: 'Notifications',
            onTap: () {},
          ),
          const Divider(
            color: Color(0xFF3B3B3B),
            height: 8,
          ),
          _ProfileItem(
            title: 'Settings',
            onTap: () {},
          ),
          const Divider(
            color: Color(0xFF3B3B3B),
            height: 8,
          ),
          _ProfileItem(
            title: 'List your Events',
            onTap: () {},
          ),
          const Divider(
            color: Color(0xFF3B3B3B),
            height: 8,
          ),
          _ProfileItem(
            title: 'Referral',
            onTap: () {},
          ),
          const Divider(
            color: Color(0xFF3B3B3B),
            height: 8,
          ),
          _ProfileItem(
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
          if (_helpDropDown) const _HelpDropDown(),
          const Divider(
            color: Color(0xFF3B3B3B),
            height: 8,
          ),
          _ProfileItem(
            title: 'Privacy Policy',
            onTap: () {
              context.navigateTo(const PrivacyPolicyRoute());
            },
          ),
          const Divider(
            color: Color(0xFF3B3B3B),
            height: 8,
          ),
          _ProfileItem(
            title: 'Terms and Conditions',
            onTap: () {
              context.navigateTo(const TermsAndConditionsRoute());
            },
          ),
          const Divider(
            color: Color(0xFF3B3B3B),
            height: 8,
          ),
          _ProfileItem(
            title: 'Logout',
            titleTheme: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.red),
            onTap: () {
              // logout popup
              var logoutAlert = BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 3.5,
                  sigmaY: 3.5,
                ),
                child: AlertDialog(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  title: Column(
                    children: [
                      Image.asset('assets/gifs/delete_account.png'),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 24, bottom: 24, right: 24),
                        child: Text(
                          'Are You really want to logout from this device?',
                        ),
                      ),
                    ],
                  ),
                  titlePadding: const EdgeInsets.all(0),
                  titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                  actions: [
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: const Color(0xFF9BFFB1),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'No',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Material(
                              color: const Color.fromARGB(255, 48, 185, 77),
                              child: InkWell(
                                onTap: () {
                                  ref
                                      .read(appRepositoryProvider.notifier)
                                      .logout();
                                },
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Yes',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );

              showDialog(
                context: context,
                builder: (context) => logoutAlert,
              );

              // showModalBottomSheet(
              //   context: context,
              //   builder: (context) => Container(
              //     decoration: const BoxDecoration(
              //       color: Color.fromARGB(255, 22, 22, 22),
              //       borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(20),
              //         topRight: Radius.circular(20),
              //       ),
              //     ),
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: authViewHorizontalPadding,
              //       vertical: 20,
              //     ),
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Text(
              //           'Are You Really want to Log out from this device?',
              //           style: Theme.of(context).textTheme.bodyMedium,
              //         ),
              //         const SizedBox(height: 20),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Expanded(
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(8),
              //                 child: Material(
              //                   color: Colors.transparent,
              //                   child: InkWell(
              //                     onTap: () {
              //                       Navigator.of(context).pop();
              //                     },
              //                     child: Container(
              //                       height: 40,
              //                       decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.circular(8),
              //                         border: Border.all(
              //                           color: const Color(0xFF9BFFB1),
              //                         ),
              //                       ),
              //                       child: Center(
              //                         child: Text(
              //                           'No',
              //                           style: Theme.of(context)
              //                               .textTheme
              //                               .bodySmall,
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             const SizedBox(width: 20),
              //             Expanded(
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(8),
              //                 child: Material(
              //                   color: const Color(0xFFF55D78),
              //                   child: InkWell(
              //                     onTap: () {
              //                       // ref
              //                       //     .read(appRepositoryProvider.notifier)
              //                       //     .logout();
              //                     },
              //                     child: Container(
              //                       height: 40,
              //                       decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.circular(8),
              //                       ),
              //                       child: Center(
              //                         child: Text(
              //                           'Yes',
              //                           style: Theme.of(context)
              //                               .textTheme
              //                               .bodySmall,
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         const SizedBox(height: 20),
              //       ],
              //     ),
              //   ),
              // );

              // showFusshnBottomSheet(
              //   context: context,
              //   builder: (context) => Container(
              //     // padding: const EdgeInsets.symmetric(
              //     //   horizontal: homeTabHorizontalPadding,
              //     //   vertical: 10,
              //     // ),
              //     // color: Theme.of(context).scaffoldBackgroundColor,
              //     color: Colors.pink,
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Text(
              //           'Are You Really want to Log out from this device?',
              //           style: Theme.of(context).textTheme.bodyMedium,
              //         ),
              //         SizedBox(height: 20),
              //         // Row(
              //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         //   children: [
              //         //     ElevatedButton(
              //         //       onPressed: () {},
              //         //       child: Text('Hi'),
              //         //     ),
              //         //   ],
              //         // ),
              //       ],
              //     ),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}

class _HelpDropDown extends StatelessWidget {
  const _HelpDropDown();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 12),
      child: Column(
        children: [
          _ProfileItem(
            title: 'Contact Us',
          ),
          _ProfileItem(
            title: 'Send Feedback',
          ),
        ],
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  const _ProfileItem({
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
