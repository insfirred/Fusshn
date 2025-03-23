import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
            // Row(
            //   children: lineup.map((e) => _ArtistItem(e)).toList(),
            // ),
            _ArtistItem(lineup.first),
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

  // String _generateArtistNames() {
  //   String res = '';
  //   for (var artist in lineup) {
  //     res = '$res${artist.name}, ';
  //   }
  //   int len = res.length;
  //   return res.substring(0, len - 2);
  // }
}

class _ArtistItem extends StatelessWidget {
  const _ArtistItem(this.artist);

  final ArtistData artist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: artist.imageUrl,
              width: 80,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            artist.name,
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
