import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/dimens.dart';
import '../common_widgets/fusshn_appbar.dart';
import 'components/all_cities_section.dart';
import 'components/location_search_box.dart';
import 'components/popular_cities_section.dart';
import 'select_location_view_model.dart';

@RoutePage()
class SelectLocationView extends ConsumerWidget {
  const SelectLocationView({
    super.key,
    this.isFirstLocationView = false,
  });

  final bool isFirstLocationView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(
      selectLocationViewModelProvider.select((_) => _.status),
    );

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              FusshnAppBar(
                label: 'Select your city',
                showBackButton: !isFirstLocationView,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: homeTabHorizontalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      LocationSearchBox(isFirstLocationView),
                      const SizedBox(height: 20),
                      PopularCitiesSection(isFirstLocationView),
                      const SizedBox(height: 20),
                      Divider(color: Colors.grey.shade700),
                      AllCitiesSection(isFirstLocationView),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (status == SelectLocationViewStatus.LOCATION_FETCHING) ...[
            const _LocationFetchingLoadingScreen(),
          ],
        ],
      ),
    );
  }
}

class _LocationFetchingLoadingScreen extends StatelessWidget {
  const _LocationFetchingLoadingScreen();

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5,
        sigmaY: 5,
      ),
      child: Center(
        child: DefaultTextStyle(
          style: GoogleFonts.poppins(
            fontSize: 18,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText(
                'Fetching Location...',
                textStyle: GoogleFonts.poppins(
                  // color: Theme.of(context).primaryColor,
                  color: Colors.white,
                ),
              ),
            ],
            repeatForever: true,
            isRepeatingAnimation: true,
          ),
        ),
      ),
    );
  }
}
