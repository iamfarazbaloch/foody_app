import 'package:flutter/material.dart';
import 'package:foody_app/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFF939B), Color(0xFFEF2A39)],
                stops: [0.0066, 0.647],
              ),
            ),
            child: Center(
              child: Text(
                'Foodgo',
                style: GoogleFonts.lobster(color: Colors.white, fontSize: 50),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset('assets/images/side.png'),
          ),
          Positioned(
            bottom: 0,
            left: 140,
            child: Image.asset('assets/images/midle.png'),
          ),
        ],
      ),
    );
  }
}
