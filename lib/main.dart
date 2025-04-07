import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fusshn/src/services/notification_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'firebase_options.dart';
import 'src/app.dart';
import 'src/common/hive_keys.dart';
import 'src/services/preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox<Map>(HiveKeys.myLocationDataBoxKey);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Supabase.initialize(
    url: 'https://zuepyymuebmlbwynssnk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp1ZXB5eW11ZWJtbGJ3eW5zc25rIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDMxMDc4MzEsImV4cCI6MjA1ODY4MzgzMX0.n8D1-BW24trTLNF9dZaUfEeZcBO4hsRhg60h9Udllxs',
  );

  // for all users, subscribe to general topic.

  final sharedPreferences = await SharedPreferences.getInstance();
  final container = ProviderContainer(overrides: [
    sharedPreferencesProvider.overrideWithValue(sharedPreferences),
  ]);

  // currently skipping for ios
  if (!Platform.isIOS) {
    await FirebaseMessaging.instance.subscribeToTopic('general');
    NotificationService().initNotifications();
  }

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: FusshnApp(),
    ),
  );
}
