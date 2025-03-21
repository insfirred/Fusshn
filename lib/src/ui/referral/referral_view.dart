import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../common/dimens.dart';
import '../common_widgets/fusshn_appbar.dart';

@RoutePage()
class ReferralView extends StatelessWidget {
  const ReferralView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: homeTabHorizontalPadding,
            ),
            child: Column(
              children: [
                const FusshnAppBar(label: 'Referral'),
                Expanded(
                  child: Center(
                    child: Text(
                      'Coming Soon',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(color: const Color(0xFFF1F1F1)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
