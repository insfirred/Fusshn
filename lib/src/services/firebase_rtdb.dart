import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseRtdb = Provider<FirebaseDatabase>(
  (ref) => FirebaseDatabase.instance,
);
