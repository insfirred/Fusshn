import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../common/dimens.dart';
import '../common_widgets/fusshn_appbar.dart';
import 'components/all_cities_section.dart';
import 'components/location_search_box.dart';
import 'components/popular_cities_section.dart';

@RoutePage()
class SelectLocationView extends StatelessWidget {
  const SelectLocationView({super.key});

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
              const FusshnAppBar(label: 'Select your city'),
              const SizedBox(height: 20),
              const PopularCitiesSection(),
              const LocationSearchBox(),
              const SizedBox(height: 20),
              Divider(color: Colors.grey.shade700),
              const AllCitiesSection(),
            ],
          ),
        ),
      ),
    );
  }
}
