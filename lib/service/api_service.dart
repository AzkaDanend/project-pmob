import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/mentor_model.dart';
import '../models/video_model.dart';

class ApiService {
  // Pastikan IP dan Port sesuai dengan Laragon kamu
  static const String baseUrl = 'http://10.0.2.2:8080/api';

  // Helper untuk header agar tidak ngetik berulang kali
  Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // ================= MENTOR FUNCTIONS =================

  Future<List<Mentor>> fetchMentors() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/debug-db'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseJson = json.decode(response.body);
        List<dynamic> mentorData = responseJson['data']['mentors'];
        return mentorData.map((json) => Mentor.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data mentor: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan koneksi mentor: $e');
    }
  }

  // ================= VIDEO CRUD FUNCTIONS =================

  // 1. READ
  Future<List<Video>> fetchVideos() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/videos'),
        headers: _headers,
      );
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((item) => Video.fromJson(item)).toList();
      } else {
        throw Exception('Gagal mengambil data video');
      }
    } catch (e) {
      throw Exception('Kesalahan Koneksi Video: $e');
    }
  }

  // 2. CREATE
  Future<bool> addVideo(String title, String url, String duration) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/videos'),
        headers: _headers,
        body: jsonEncode({
          'TITLE': title, // Huruf kapital sesuai DB Faisal
          'VIDEO_URL': url,
          'DURASI': duration,
        }),
      );
      return response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  // 3. UPDATE
  Future<bool> updateVideo(
    int id,
    String title,
    String url,
    String duration,
  ) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/videos/$id'),
        headers: _headers,
        body: jsonEncode({
          'TITLE': title,
          'VIDEO_URL': url,
          'DURASI': duration,
        }),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // 4. DELETE
  Future<bool> deleteVideo(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/videos/$id'),
        headers: _headers,
      );
      return response.statusCode == 204 || response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
