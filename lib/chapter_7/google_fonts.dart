import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontsDemo extends StatelessWidget {
  const GoogleFontsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Google Fonts Demo',
          style: GoogleFonts.pacifico(fontSize: 24),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Roboto - Google Fonts',
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Lobster - Phong cách',
              style: GoogleFonts.lobster(
                fontSize: 28,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Montserrat - Hiện đại',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Dancing Script - Bay bổng',
              style: GoogleFonts.dancingScript(
                fontSize: 26,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
