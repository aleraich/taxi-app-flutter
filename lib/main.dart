import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'menu_screen.dart';
import 'profile_screen.dart';
import 'taxi_request_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio Móvil 15 de Abril',
      theme: ThemeData(
        primaryColor: const Color(0xFF4CAF50),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF212121),
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Color(0xFF212121),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4CAF50),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/menu': (context) => const MenuScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/taxi-request': (context) => const TaxiRequestScreen(),
      },
    );
  }
}