import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/config/app_routes.dart';
//import '/config/app_theme.dart';
import '/viewmodels/auth_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _controller.forward();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    final authVM = context.read<AuthViewModel>();
    final isLoggedIn = await authVM.checkLoginStatus();

    if (!mounted) return;
    Navigator.pushReplacementNamed(
      context,
      isLoggedIn ? AppRoutes.dashboard : AppRoutes.login,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Diubah menjadi putih bersih sesuai desain
      body: Center( // Menggunakan Center agar logo persis di tengah
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeAnimation.value,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                // Mengganti Column yang berisi teks/icon lama dengan gambar logo
                child: Image.asset(
                  'assets/images/markup.png', // Pastikan nama aset ini sesuai dengan di pubspec.yaml
                  width: 250, // Ukuran bisa dibesarkan/dikecilkan sesuai selera
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}