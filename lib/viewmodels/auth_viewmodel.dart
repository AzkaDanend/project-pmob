// ============================================
// FILE: lib/viewmodels/auth_viewmodel.dart
// ============================================

import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Login — untuk minggu ini pakai dummy login
  // Nanti di minggu berikutnya akan konek ke Laravel API
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simulasi delay network
      await Future.delayed(const Duration(seconds: 1));

      // Dummy validation (ganti dengan API call nanti)
      if (email == 'admin@markup.com' && password == 'password') {
        await StorageService.saveToken('dummy_token_12345');
        await StorageService.saveUserInfo('Admin Mark-Up', email);
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Email atau password salah';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'Terjadi kesalahan. Coba lagi.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Register — dummy untuk minggu ini, nanti konek ke Laravel API
  // TAMBAHAN: Menambahkan parameter universityName
// Register — dummy untuk minggu ini, nanti konek ke Laravel API
  Future<bool> register(String name, String email, String universityName, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 1));

      // Dummy: anggap registrasi selalu berhasil
      await StorageService.saveToken('dummy_token_register');
      
      // PERUBAHAN DI SINI:
      // Mengirimkan parameter university ke StorageService
      await StorageService.saveUserInfo(name, email, university: universityName); 
      
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Registrasi gagal. Coba lagi.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Logout
  Future<void> logout() async {
    await StorageService.clearAll();
    notifyListeners();
  }

  // Check login status (untuk splash screen)
  Future<bool> checkLoginStatus() async {
    return await StorageService.isLoggedIn();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}