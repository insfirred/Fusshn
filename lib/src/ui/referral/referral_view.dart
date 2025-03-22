import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../common_widgets/fusshn_appbar.dart';

@RoutePage()
class ReferralView extends StatelessWidget {
  const ReferralView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const FusshnAppBar(label: 'Referral'),
            Expanded(
              child: Center(
                child: Lottie.asset(
                  'assets/lottie/coming_soon.json',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
