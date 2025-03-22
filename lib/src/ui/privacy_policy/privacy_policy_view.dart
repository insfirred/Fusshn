import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fusshn/src/common/dimens.dart';
import 'package:fusshn/src/ui/common_widgets/fusshn_appbar.dart';

import '../../common/privacy_policies_vals.dart';

@RoutePage()
class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const FusshnAppBar(label: 'Privacy Policy'),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(
                top: 22,
                left: homeTabHorizontalPadding,
                right: homeTabHorizontalPadding,
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: privacyPoliciesVals.length,
              itemBuilder: (context, index) => _PnpItem(
                privacyPoliciesVals[index],
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

class _PnpItem extends StatelessWidget {
  const _PnpItem(this.item);

  final PrivacyPolicyModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // MAIN TITLE
        Text(
          item.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 6),

        // POINTS without sub-titles
        if (item.points.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: item.points.length,
              itemBuilder: (context, index) => RichText(
                text: TextSpan(
                  children: [
                    if (item.points[index].header.isNotEmpty) ...[
                      TextSpan(
                        text: '${item.points[index].header}: ',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                    TextSpan(
                      text: item.points[index].point,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
            ),
          ),
          const SizedBox(height: 6),
        ],

        // SUB-TITLES and POINTS
        if (item.subModels.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: item.subModels.length,
              itemBuilder: (context, index1) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.subModels[index1].subtitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 18),
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: item.subModels[index1].pointModels.length,
                    itemBuilder: (context, index2) => RichText(
                      text: TextSpan(
                        children: [
                          if (item.subModels[index1].pointModels[index2].header
                              .isNotEmpty) ...[
                            TextSpan(
                              text:
                                  '${item.subModels[index1].pointModels[index2].header}: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                          TextSpan(
                              text: item
                                  .subModels[index1].pointModels[index2].point,
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index2) =>
                        const SizedBox(height: 8),
                  ),
                ],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
            ),
          ),
          const SizedBox(height: 6),
        ],
      ],
    );
  }
}
