// ============================================
// FILE: lib/models/menu_item_model.dart
// ============================================

import 'package:flutter/material.dart';

class MenuItemModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String route;

  MenuItemModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.route,
  });
}