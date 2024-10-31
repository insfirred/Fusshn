import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../common/indian_cities.dart';

class PopularCitiesSection extends StatelessWidget {
  const PopularCitiesSection({
    super.key,
  });

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
          itemBuilder: (context, index) => Column(
            children: [
              SvgPicture.asset(
                'assets/indian_cities/mumbai_logo.svg',
                color: index != 0 ? Colors.white : null,
              ),
              const SizedBox(height: 16),
              Text(
                popularIndianCities[index],
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
