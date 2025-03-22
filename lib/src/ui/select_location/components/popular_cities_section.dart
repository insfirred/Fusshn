import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

import '../../../common/indian_cities.dart';
import '../../../repositories/app_repository.dart';
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
        const SizedBox(height: 10),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: popularIndianCities.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) => _PopularCityItem(
            city: popularIndianCities[index].name,
            icon: popularIndianCities[index].icon,
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
    required this.icon,
    required this.isFirstLocationView,
  });

  final String city;
  final String icon;
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

        context.maybePop();
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/indian_cities/$icon.svg',
              alignment: Alignment.bottomCenter,
              width: 40,
              color: isSelected ? const Color(0xFF17BD3B) : Colors.white,
            ),
            const SizedBox(height: 8),
            Text(
              city,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: isSelected ? const Color(0xFF17BD3B) : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
