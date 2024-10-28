import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fusshn/src/common/dimens.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../common_widgets/animated_gradient_background.dart';
import 'components/profile_menu.dart';
import 'components/user_details.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AnimatedGradientBackground(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: homeTabHorizontalPadding,
              ),
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
        ),
      ),
    );
  }
}

class VersionInfo extends StatefulWidget {
  const VersionInfo({
    super.key,
  });

  @override
  State<VersionInfo> createState() => _VersionInfoState();
}

class _VersionInfoState extends State<VersionInfo> {
  String version = '';

  @override
  void initState() {
    super.initState();
    fetchVersion();
  }

  fetchVersion() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      version = info.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Build by Kalash and Garvit with ❣️',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const Spacer(),
        Text(
          'v$version',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
