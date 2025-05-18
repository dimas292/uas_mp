import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10), // Durasi animasi
    );

    // Menjalankan navigasi setelah animasi selesai
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Dapatkan tema dari context
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animasi Lottie
            Lottie.asset(
              'assets/lottie/Animation - 1747565549485.json', // Ganti dengan nama file Lottie Anda
              controller: _controller,
              width: 300,
              height: 300,
              fit: BoxFit.contain,
              onLoaded: (composition) {
                // Mulai animasi setelah widget di-build
                _controller.forward();
              },
            ),
            SizedBox(height: 20),
            Text(
              'Portofolio',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}