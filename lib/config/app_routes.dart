// ============================================
// FILE: lib/config/app_routes.dart
// ============================================

import 'package:flutter/material.dart';
import '/views/splash_screen/splash_screen.dart';
import '/views/login_screen/login_screen.dart';
import '/views/dashboard_screen/dashboard_screen.dart';
import '/views/register_screen/register_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    dashboard: (context) => const DashboardScreen(),
  };
}


