import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/repositories/app_repository.dart';

import '../select_location_view_model.dart';

class AllCitiesSection extends ConsumerWidget {
  const AllCitiesSection(
    this.isFirstLocationView, {
    super.key,
  });

  final bool isFirstLocationView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allCities = ref.watch(
      selectLocationViewModelProvider.select((_) => _.allIndianCities),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'All cities',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: allCities.length,
          itemBuilder: (context, index) => _CityItem(
            city: allCities[index],
            isFirstLocationView: isFirstLocationView,
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        ),
      ],
    );
  }
}

class _CityItem extends ConsumerWidget {
  const _CityItem({
    required this.city,
    required this.isFirstLocationView,
  });

  final String city;
  final bool isFirstLocationView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isSelected = city ==
        ref.watch(appRepositoryProvider.select(
          (_) => _.userLocationData?.city,
        ));

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
      child: Text(
        city,
        style: TextStyle(
          fontSize: 14,
          color: isSelected ? const Color(0xFF17BD3B) : Colors.white,
        ),
      ),
    );
  }
}
