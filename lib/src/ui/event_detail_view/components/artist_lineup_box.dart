import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../common/dimens.dart';
import '../../../models/artist_data.dart';

class ArtistLineupBox extends StatelessWidget {
  const ArtistLineupBox({
    super.key,
    required this.lineup,
  });

  final List<ArtistData> lineup;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: homeTabHorizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Artist Lineup',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFAFAFA)),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: lineup
                          .map(
                            (artist) => Image.network(
                              artist.imageUrl,
                              width: 32,
                              height: 32,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: Text(
                      _generateArtistNames(),
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Divider(
              color: Color(0xFF3F3F3F),
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

  String _generateArtistNames() {
    String res = '';
    for (var artist in lineup) {
      res = '$res${artist.name}, ';
    }
    int len = res.length;
    return res.substring(0, len - 2);
  }
}
