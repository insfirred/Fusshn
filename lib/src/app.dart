import 'package:flutter/material.dart';

import 'routing/app_router.dart';

class FusshnApp extends StatelessWidget {
  final _appRouter = AppRouter();

  FusshnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      title: 'Fusshn',
    );
  }
}
