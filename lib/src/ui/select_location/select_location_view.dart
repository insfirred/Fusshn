import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../common/dimens.dart';
import '../common_widgets/fusshn_appbar.dart';
import 'components/all_cities_section.dart';
import 'components/location_search_box.dart';
import 'components/popular_cities_section.dart';

@RoutePage()
class SelectLocationView extends StatelessWidget {
  const SelectLocationView({
    super.key,
    this.isFirstLocationView = false,
  });

  final bool isFirstLocationView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: homeTabHorizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FusshnAppBar(
                label: 'Select your city',
                showBackButton: !isFirstLocationView,
              ),
              const SizedBox(height: 20),
              PopularCitiesSection(isFirstLocationView),
              const LocationSearchBox(),
              const SizedBox(height: 20),
              Divider(color: Colors.grey.shade700),
              AllCitiesSection(isFirstLocationView),
            ],
          ),
        ),
      ),
    );
  }
}
