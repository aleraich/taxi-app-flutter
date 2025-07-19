import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  bool _isValidating = false;

  void _navigateToRegister(BuildContext context) {
    setState(() {
      _isValidating = true;
    });
    // Simula redirección tras 1 segundo
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isValidating = false;
      });
      Navigator.pushNamed(context, '/register');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Radio Móvil 15 de Abril',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Ingresa tu número de celular',
                style: TextStyle(fontSize: 16, color: Color(0xFF757575)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _isValidating
                        ? null
                        : () => _navigateToRegister(context),
                    child: const Text('Enviar por WhatsApp'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _isValidating
                        ? null
                        : () => _navigateToRegister(context),
                    child: const Text('Enviar por SMS'),
                  ),
                ],
              ),
              if (_isValidating) ...[
                const SizedBox(height: 20),
                const Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}