import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/repositories/app_repository.dart';
import 'package:svg_flutter/svg.dart';

import '../../../common/indian_cities.dart';
import '../select_location_view_model.dart';

class PopularCitiesSection extends StatelessWidget {
  const PopularCitiesSection(
    this.isFirstLocationView, {
    super.key,
  });

  final bool isFirstLocationView;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular cities',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 20),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: popularIndianCities.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) => _PopularCityItem(
            city: popularIndianCities[index],
            isFirstLocationView: isFirstLocationView,
          ),
        ),
      ],
    );
  }
}

class _PopularCityItem extends ConsumerWidget {
  const _PopularCityItem({
    required this.city,
    required this.isFirstLocationView,
  });

  final String city;
  final bool isFirstLocationView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCity = ref.watch(
      appRepositoryProvider.select((_) => _.userLocationData?.city),
    );
    bool isSelected = city == selectedCity;

    return GestureDetector(
      onTap: () {
        ref
            .read(selectLocationViewModelProvider.notifier)
            .setUserLocationInDbAndState(
              city: city,
              pincode: '250110',
              lat: 0,
              lng: 0,
            );

        if (!isFirstLocationView) {
          context.maybePop();
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/indian_cities/mumbai_logo.svg',
            color: isSelected ? const Color(0xFF17BD3B) : Colors.white,
          ),
          const SizedBox(height: 16),
          Text(
            city,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? const Color(0xFF17BD3B) : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
