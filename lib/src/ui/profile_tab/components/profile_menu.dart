import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/app_repository.dart';
import '../../../routing/app_router.dart';

class ProfileMenu extends ConsumerStatefulWidget {
  const ProfileMenu();

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
