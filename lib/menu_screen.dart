import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context)?.settings.arguments as Map<String, String>? ?? {};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Móvil Suecia'),
        backgroundColor: const Color(0xFF4CAF50),
      ),
      drawer: AppDrawer(
        currentRoute: '/menu',
        userData: userData,
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

// Este es el menú reutilizable para todas las pantallas
class AppDrawer extends StatelessWidget {
  final String currentRoute;
  final Map<String, String> userData;

  const AppDrawer({
    super.key,
    required this.currentRoute,
    required this.userData,
  });

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pop(context); // Cierra el drawer

    if (routeName == currentRoute) return;

    if (routeName == '/login') {
      Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
    } else {
      Navigator.pushReplacementNamed(context, routeName, arguments: userData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            selected: currentRoute == '/profile',
            selectedTileColor: Colors.yellow,
            selectedColor: Colors.black,
            onTap: () => _navigateTo(context, '/profile'),
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Mis Direcciones'),
            selected: currentRoute == '/direcciones',
            selectedTileColor: Colors.yellow,
            selectedColor: Colors.black,
            onTap: () => _navigateTo(context, '/direcciones'),
          ),
          ListTile(
            leading: const Icon(Icons.remove_red_eye),
            title: const Text('Vigilar'),
            selected: currentRoute == '/vigilar',
            selectedTileColor: Colors.yellow,
            selectedColor: Colors.black,
            onTap: () => _navigateTo(context, '/vigilar'),
          ),
          ListTile(
            leading: const Icon(Icons.directions_car),
            title: const Text('Pedir Taxi'),
            selected: currentRoute == '/taxi-request',
            selectedTileColor: Colors.yellow,
            selectedColor: Colors.black,
            onTap: () => _navigateTo(context, '/taxi-request'),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Historial'),
            selected: currentRoute == '/historial',
            selectedTileColor: Colors.yellow,
            selectedColor: Colors.black,
            onTap: () => _navigateTo(context, '/historial'),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Salir'),
            selected: false,
            onTap: () => _navigateTo(context, '/login'),
          ),
        ],
      ),
    );
  }
}
