import 'package:flutter/material.dart';

void main() => runApp(const BloomApp());

class BloomApp extends StatelessWidget {
  const BloomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color darkRose = const Color(0xFFC0506E);
    final Color lightTeal = const Color(0xFFBFDCDC);
    final Color teal = const Color(0xFF77B5A8);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Fondo rosa
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            color: darkRose,
          ),
          // Contenido principal
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Logo + texto Bloom
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 4.0), // Mueve el logo un poco a la izquierda
                      child: Image.asset(
                        'assets/logo.png',
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 8), // Menor separación con el texto
                    const Text(
                      'Bloom',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 2.5,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                const Text(
                  'Iniciar sesión',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 30),
                // Tarjeta del formulario
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: lightTeal,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(2, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildInputField(
                          icon: Icons.email, hint: 'Correo', color: teal),
                      const SizedBox(height: 20),
                      _buildInputField(
                          icon: Icons.lock, hint: 'Contraseña', color: teal),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkRose,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 12),
                          child: Text(
                            'Iniciar sesion',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Crear cuenta',
                          style: TextStyle(color: darkRose),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(
      {required IconData icon, required String hint, required Color color}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.white),
                border: InputBorder.none,
              ),
              obscureText: hint == 'Contraseña',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
