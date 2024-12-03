import 'package:flutter/material.dart';
import 'dart:async'; // Untuk timer

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 1.0; // Awal opacity (penuh)

  @override
  void initState() {
    super.initState();

    // Timer untuk memulai efek fade out setelah 2 detik
    Timer(const Duration(milliseconds: 900), () {
      setState(() {
        _opacity = 0.0; // Kurangi opacity menjadi 0 (fade out)
      });

      // Timer untuk berpindah halaman setelah animasi selesai (3 detik total)
      Timer(const Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, '/login');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedOpacity(
            duration: const Duration(seconds: 1), // Durasi fade out
            opacity: _opacity,
            child: Image.asset(
              'Assets/splash.png', // Ganti dengan path gambar kamu
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}