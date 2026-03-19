// ============================================
// FILE: lib/config/api_config.dart
// ============================================

class ApiConfig {
  // Ganti dengan IP address laptop kamu saat develop
  // Untuk emulator Android: 10.0.2.2
  // Untuk device fisik: IP lokal laptop (misal 192.168.x.x)
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  // Endpoints (akan dipakai di minggu-minggu berikutnya)
  static const String login = '/login';
  static const String register = '/register';
  static const String logout = '/logout';
  static const String profile = '/profile';
  static const String packages = '/packages';
  static const String modules = '/modules';
  static const String videos = '/videos';
  static const String mentors = '/mentors';
  static const String bookings = '/bookings';
  static const String competitions = '/competitions';
}