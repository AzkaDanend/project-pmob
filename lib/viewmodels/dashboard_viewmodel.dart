// ============================================
// FILE: lib/viewmodels/dashboard_viewmodel.dart
// ============================================

import 'package:flutter/material.dart';
import '../models/menu_item_model.dart';
import '../config/app_routes.dart';
import '../services/storage_service.dart';

class DashboardViewModel extends ChangeNotifier {
  String _userName = 'User';
  String _userUniversity = ''; // TAMBAHAN: Untuk menyimpan data kampus

  String get userName => _userName;
  String get userUniversity => _userUniversity; // Getter untuk UI

  // Menu items untuk dashboard
  List<MenuItemModel> get menuItems => [
    MenuItemModel(
      title: 'Profil Organisasi',
      subtitle: 'Tentang Mark-Up',
      icon: Icons.business_rounded,
      color: const Color(0xFF00146B), // Disesuaikan dengan brandNavy
      route: AppRoutes.dashboard, // nanti ganti ke route profil
    ),
    MenuItemModel(
      title: 'Mentor',
      subtitle: 'Daftar mentor kami',
      icon: Icons.people_rounded,
      color: const Color(0xFF00796B),
      route: AppRoutes.dashboard,
    ),
    MenuItemModel(
      title: 'Paket Belajar',
      subtitle: 'Pilih paket kamu',
      icon: Icons.card_membership_rounded,
      color: const Color(0xFF8B008B), // Disesuaikan dengan brandPurple
      route: AppRoutes.dashboard,
    ),
    MenuItemModel(
      title: 'Modul & Video',
      subtitle: 'Materi pembelajaran',
      icon: Icons.play_lesson_rounded,
      color: const Color(0xFFF57C00),
      route: AppRoutes.dashboard,
    ),
    MenuItemModel(
      title: 'Live Mentoring',
      subtitle: 'Booking sesi mentor',
      icon: Icons.video_call_rounded,
      color: const Color(0xFFE53935),
      route: AppRoutes.dashboard,
    ),
    MenuItemModel(
      title: 'Lomba & Event',
      subtitle: 'Info kompetisi terbaru',
      icon: Icons.emoji_events_rounded,
      color: const Color(0xFF2E7D32),
      route: AppRoutes.dashboard,
    ),
  ];

  // Load user info (nama dan universitas) dari SharedPreferences
  Future<void> loadUserInfo() async {
    final name = await StorageService.getUserName();
    final university = await StorageService.getUserUniversity();
    
    _userName = name ?? 'User';
    _userUniversity = university ?? 'Universitas Tidak Diketahui';
    
    notifyListeners();
  }
}