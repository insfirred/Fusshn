import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventSearchResult extends StatelessWidget {
  const EventSearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: const Text('Arijit Singh - Chandigarh'),
        titleTextStyle:
            Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
        subtitle: Text(
          '${DateFormat().add_jm().format(DateTime.now())}, ${DateFormat('d MMMM y').format(DateTime.now())}',
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fkaran_poster.jpg?alt=media&token=fdb1d4df-cc17-4b7f-a32f-cd589a54896d',
            width: 40,
            height: 40,
            cacheWidth: 40,
            cacheHeight: 40,
          ),
        ),
      ),
    );
  }
}
