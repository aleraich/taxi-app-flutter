import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context)?.settings.arguments as Map<String, String>? ?? {};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: const Color(0xFF4CAF50),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Información del Usuario',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Nombre: ${userData['name'] ?? 'No especificado'}',
                style: const TextStyle(fontSize: 16, color: Color(0xFF212121)),
              ),
              const SizedBox(height: 10),
              Text(
                'Correo: ${userData['email'] ?? 'No especificado'}',
                style: const TextStyle(fontSize: 16, color: Color(0xFF212121)),
              ),
              const SizedBox(height: 10),
              Text(
                'Dirección: ${userData['address'] ?? 'No especificada'}',
                style: const TextStyle(fontSize: 16, color: Color(0xFF212121)),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Regresa al menú
                },
                child: const Text(
                  'Volver',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}