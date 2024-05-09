import 'package:flutter/material.dart';

import 'routing/app_router.dart';
import 'theme/theme.dart';

class FusshnApp extends StatelessWidget {
  final _appRouter = AppRouter();

  FusshnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: myTheme,
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      title: 'Fusshn',
    );
  }
}
