import 'package:cinepolis_ukl/views/cinema_page.dart';
import 'package:cinepolis_ukl/views/dashboard.dart';
import 'package:cinepolis_ukl/views/login_page.dart';
import 'package:cinepolis_ukl/views/movie_page.dart';
import 'package:cinepolis_ukl/views/myBooking_page.dart';
import 'package:cinepolis_ukl/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => Dashboard(),
        '/mybooking': (context) => MybookingPage(),
        '/movie': (context) => MoviePage(),
        '/cinema': (context) => CinemaPage(),

        
      },
    );
  }
}