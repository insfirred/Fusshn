import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../common/dimens.dart';
import '../common_widgets/animated_gradient_background.dart';
import 'components/profile_menu.dart';
import 'components/user_details.dart';
import 'components/version_info.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedGradientBackground(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(homeTabHorizontalPadding),
                child: Text(
                  'Profile',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              const Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: homeTabHorizontalPadding,
                  ),
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      UserDetails(),
                      ProfileMenu(),
                      SizedBox(height: 30),
                      VersionInfo(),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
