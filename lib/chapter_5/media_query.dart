import 'package:flutter/material.dart';

class MediaQueryDemo extends StatelessWidget {
  const MediaQueryDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(title: const Text('MediaQuery Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chiều rộng: ${screenWidth.toStringAsFixed(0)} px'),
            Text('Chiều cao: ${screenHeight.toStringAsFixed(0)} px'),
            Text('Hướng: ${isLandscape ? "Ngang" : "Dọc"}'),
            const SizedBox(height: 20),
            // Widget có kích thước theo % màn hình
            Container(
              width: screenWidth * 0.7, // 70% chiều rộng
              height: screenHeight * 0.2, // 20% chiều cao
              color: Colors.blue,
              child: const Center(
                child: Text(
                  '70% chiều rộng\n20% chiều cao',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
