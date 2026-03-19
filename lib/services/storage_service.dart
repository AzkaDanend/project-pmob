// ============================================
// FILE: lib/services/storage_service.dart
// ============================================

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _tokenKey = 'auth_token';
  static const String _userNameKey = 'user_name';
  static const String _userEmailKey = 'user_email';
  static const String _userUniversityKey = 'user_university'; // TAMBAHAN: Key untuk universitas

  // Save token setelah login
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  // Get token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Save user info (Diperbarui untuk menerima university)
  static Future<void> saveUserInfo(String name, String email, {String? university}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userNameKey, name);
    await prefs.setString(_userEmailKey, email);
    
    // Simpan universitas jika ada
    if (university != null && university.isNotEmpty) {
      await prefs.setString(_userUniversityKey, university);
    }
  }

  // Get user name
  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey);
  }
  
  // Get user email
  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmailKey);
  }

  // TAMBAHAN: Get user university
  static Future<String?> getUserUniversity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userUniversityKey);
  }

  // Check apakah sudah login
  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  // Clear semua data (logout)
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}