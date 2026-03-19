import 'package:flutter/material.dart';

import 'config/app_routes.dart';

import 'config/app_theme.dart';


class MarkUpApp extends StatelessWidget {
  const MarkUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mark-Up',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}