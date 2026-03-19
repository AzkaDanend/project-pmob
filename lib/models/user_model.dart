// ============================================
// FILE: lib/models/user_model.dart
// ============================================

class UserModel {
  final int id;
  final String name; // Ini akan menampung data 'Full Name'
  final String email;
  final String? universityName; // TAMBAHAN BARU: Menampung asal universitas
  final String role;
  final String? token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.universityName, // Tambahkan di constructor (bisa nullable)
    required this.role,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      // Pastikan key 'university_name' ini persis sama dengan yang dikirim dari Backend/API kamu
      universityName: json['university_name'], 
      role: json['role'] ?? 'user',
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'university_name': universityName, // Sesuaikan juga key-nya di sini
      'role': role,
      'token': token,
    };
  }
}