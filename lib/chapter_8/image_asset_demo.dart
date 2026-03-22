import 'package:flutter/material.dart';

class ImageAssetDemo extends StatelessWidget {
  const ImageAssetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Assets Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Cách 1: Image.asset cơ bản
            Image.asset('assets/images/logo.png', width: 150, height: 150),
            const SizedBox(height: 20),
            // Cách 2: Với BoxFit
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover, // cover, contain, fill, fitWidth, fitHeight
              ),
            ),
            const SizedBox(height: 20),
            // Cách 3: Với màu phủ (tinting)
            Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
              color: Colors.blue,
              colorBlendMode: BlendMode.multiply,
            ),
          ],
        ),
      ),
    );
  }
}
