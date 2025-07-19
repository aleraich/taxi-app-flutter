import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'menu_screen.dart';  // Ajusta la ruta si está en otra carpeta

class TaxiRequestScreen extends StatefulWidget {
  final Map<String, String> userData;

  const TaxiRequestScreen({super.key, this.userData = const {}});

  @override
  State<TaxiRequestScreen> createState() => _TaxiRequestScreenState();
}

class _TaxiRequestScreenState extends State<TaxiRequestScreen> {
  final MapController _mapController = MapController();
  LatLng currentLocation = const LatLng(-17.432432235007248, -66.1527767294336);

  bool selectingDestination = false;
  LatLng? destination;
  LatLng? cursor;

  double zoom = 15;

  void _zoomIn() {
    zoom = (zoom + 1).clamp(1, 18).toDouble();
    _mapController.move(_mapController.camera.center, zoom);
  }

  void _zoomOut() {
    zoom = (zoom - 1).clamp(1, 18).toDouble();
    _mapController.move(_mapController.camera.center, zoom);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final Map<String, String> userData = (args is Map<String, String>) ? args : widget.userData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedir Taxi'),
        backgroundColor: const Color(0xFF4CAF50),
      ),
      drawer: AppDrawer(
        currentRoute: '/taxi-request',
        userData: userData,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: currentLocation,
                    initialZoom: zoom,
                    onPositionChanged: (position, hasGesture) {
                      if (selectingDestination) {
                        setState(() {
                          cursor = position.center;
                        });
                      }
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.hello_flutter',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: currentLocation,
                          width: 40,
                          height: 40,
                          child: const Icon(Icons.my_location, color: Colors.blue, size: 40),
                        ),
                        if (destination != null)
                          Marker(
                            point: destination!,
                            width: 40,
                            height: 40,
                            child: const Icon(Icons.location_on, color: Colors.red, size: 40),
                          ),
                        if (selectingDestination && cursor != null)
                          Marker(
                            point: cursor!,
                            width: 40,
                            height: 40,
                            child: const Icon(Icons.location_searching, color: Colors.orange, size: 40),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              if (!selectingDestination && destination == null)
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.add_location_alt),
                    label: const Text('Seleccionar destino'),
                    onPressed: () {
                      setState(() {
                        selectingDestination = true;
                        cursor = _mapController.camera.center;
                      });
                    },
                  ),
                ),
              if (selectingDestination)
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.check),
                    label: const Text('Confirmar destino'),
                    onPressed: () {
                      setState(() {
                        destination = cursor;
                        selectingDestination = false;
                      });
                    },
                  ),
                ),
              if (destination != null)
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.local_taxi),
                    label: const Text('Pedir móvil'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('¡Taxi solicitado!')),
                      );
                    },
                  ),
                ),
              const SizedBox(height: 10),
            ],
          ),
          Positioned(
            right: 10,
            bottom: 130,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: 'zoomIn',
                  mini: true,
                  onPressed: _zoomIn,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  heroTag: 'zoomOut',
                  mini: true,
                  onPressed: _zoomOut,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}