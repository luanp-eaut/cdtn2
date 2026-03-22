// Cách 1: Sử dụng font đã khai báo
import 'package:flutter/material.dart';

class CustomFontDemo extends StatelessWidget {
  const CustomFontDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Font Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'OpenSans Regular',
              style: TextStyle(fontFamily: 'OpenSans', fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              'OpenSans Bold',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'RobotoMono Regular',
              style: TextStyle(fontFamily: 'RobotoMono', fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              'RobotoMono Bold',
              style: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
