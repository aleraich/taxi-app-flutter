import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  void _navigateToProfile(BuildContext context, Map<String, String> userData) {
    Navigator.pushNamed(
      context,
      '/profile',
      arguments: userData,
    );
  }

  void _navigateToTaxiRequest(BuildContext context) {
    Navigator.pushNamed(context, '/taxi-request');
  }

  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context)?.settings.arguments as Map<String, String>? ?? {};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Móvil 15 de Abril'),
        backgroundColor: const Color(0xFF4CAF50),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF4CAF50),
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                _navigateToProfile(context, userData);
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Mis Direcciones'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                // Aquí puedes agregar navegación a una pantalla de direcciones
              },
            ),
            ListTile(
              leading: const Icon(Icons.remove_red_eye),
              title: const Text('Vigilar'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                // Aquí puedes agregar navegación a una pantalla de vigilancia
              },
            ),
            ListTile(
              leading: const Icon(Icons.directions_car),
              title: const Text('Pedir Taxi'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                _navigateToTaxiRequest(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Historial'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                // Aquí puedes agregar navegación a una pantalla de historial
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Salir'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false); // Regresa al login
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Menú Principal',
          style: TextStyle(fontSize: 24, color: Color(0xFF212121)),
        ),
      ),
    );
  }
}