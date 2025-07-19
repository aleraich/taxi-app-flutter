import 'package:flutter/material.dart';

class TaxiRequestScreen extends StatefulWidget {
  const TaxiRequestScreen({super.key});

  @override
  State<TaxiRequestScreen> createState() => _TaxiRequestScreenState();
}

class _TaxiRequestScreenState extends State<TaxiRequestScreen> {
  bool _isMarkingDestination = false;
  String _currentLocation = 'Ubicación Actual: Av. Principal 123';
  String _destination = 'Destino: No marcado';

  void _toggleMarkDestination() {
    setState(() {
      _isMarkingDestination = true;
    });
    // Simula movimiento del cursor (puedes ajustar el texto dinámicamente)
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _destination = 'Destino: Calle Secundaria 456'; // Simulación
        _isMarkingDestination = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedir Taxi'),
        backgroundColor: const Color(0xFF4CAF50),
      ),
      body: Column(
        children: [
          // Placeholder del mapa
          Container(
            height: 300,
            color: Colors.grey[300],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_currentLocation),
                  const SizedBox(height: 10),
                  Text(_destination),
                  if (_isMarkingDestination) ...[
                    const Text(
                      'Marcando destino... (mueve el cursor)',
                      style: TextStyle(fontSize: 16, color: Color(0xFF757575)),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: _isMarkingDestination ? null : _toggleMarkDestination,
              child: const Text(
                'Marcar mi Destino',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _isMarkingDestination
                ? null
                : () {
              // Simula solicitud de taxi
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Taxi solicitado!')),
              );
            },
            child: const Text(
              'Solicitar Taxi',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}