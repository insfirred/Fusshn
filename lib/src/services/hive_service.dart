import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final hiveProvider = Provider<HiveInterface>(
  (ref) => Hive,
);
