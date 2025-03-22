import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fusshn/src/ui/common_widgets/fusshn_appbar.dart';

import '../../common/dimens.dart';
import '../../common/terms_and_conditions_vals.dart';

@RoutePage()
class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const FusshnAppBar(label: 'Terms And Conditions'),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(
                left: homeTabHorizontalPadding,
                right: homeTabHorizontalPadding,
                top: 22,
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: termsAndConditions.length,
              itemBuilder: (context, index) => _TncItem(
                termsAndConditions[index],
              ),
              separatorBuilder: (context, index) => Divider(
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TncItem extends StatelessWidget {
  const _TncItem(this.termsAndConditionModel);

  final TermsAndConditionModel termsAndConditionModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(termsAndConditionModel.mainPoint),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: termsAndConditionModel.subPoints.length,
            itemBuilder: (context, index) => RichText(
              text: TextSpan(
                children: [
                  if (termsAndConditionModel.subPoints[index].header !=
                      null) ...[
                    TextSpan(
                      text:
                          '${termsAndConditionModel.subPoints[index].header}: ',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                  TextSpan(
                    text: termsAndConditionModel.subPoints[index].subPoint,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 8),
          ),
        ),
      ],
    );
  }
}
