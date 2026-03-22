import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Layout Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Hello, Flutter!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Icon(Icons.star, color: Colors.orange, size: 50),
          ],
        ),
      ),
    );
  }
}
