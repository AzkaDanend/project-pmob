import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Ganti dengan IP laptop Anda jika pakai HP fisik (misal: 192.168.1.5)
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  // Fungsi Login
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Accept': 'application/json'},
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // Simpan token ke memori HP
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', data['access_token']);
      return true;
    }
    return false;
  }

  // Fungsi Logout
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    await http.post(
      Uri.parse('$baseUrl/logout'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token', // Mengirim kartu akses ke server
      },
    );

    await prefs.remove('token'); // Hapus dari memori HP
  }
}
