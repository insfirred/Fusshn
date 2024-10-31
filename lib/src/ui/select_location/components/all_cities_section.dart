import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/ui/select_location/select_location_view_model.dart';

class AllCitiesSection extends ConsumerWidget {
  const AllCitiesSection({
    super.key,
  });

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
          itemBuilder: (context, index) => Text(
            allCities[index],
            style: const TextStyle(fontSize: 14),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ],
    );
  }
}
