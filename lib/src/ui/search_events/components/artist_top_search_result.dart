import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArtistTopSearchResult extends StatelessWidget {
  const ArtistTopSearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: const Text('Seedhe Maut'),
        titleTextStyle:
            Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
        subtitle: Text(
          'Desi HipHop',
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CachedNetworkImage(
            imageUrl:
                'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fseedhe_maut.jpg?alt=media&token=856ad4d9-1e31-4bf2-acc8-fc4d4aaf4326',
            width: 40,
            height: 40,
          ),
        ),
      ),
    );
  }
}
