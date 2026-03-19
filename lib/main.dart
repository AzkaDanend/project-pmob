// ============================================
// FILE: lib/main.dart
// ============================================

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'viewmodels/auth_viewmodel.dart';
import 'viewmodels/dashboard_viewmodel.dart';
import 'viewmodels/course_provider.dart'; // IMPORT BARU

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
        ChangeNotifierProvider(create: (_) => CourseProvider()), // TAMBAHAN BARU
      ],
      child: const MarkUpApp(),
    ),
  );
}