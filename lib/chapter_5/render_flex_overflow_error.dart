// ❌ CÁCH SAI - Gây lỗi RenderFlex overflow
import 'package:flutter/material.dart';

class WrongLayout extends StatelessWidget {
  const WrongLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sai - Sẽ bị lỗi')),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.red,
            child: const Text('Container 1'),
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.blue,
            child: const Text('Container 2'),
          ),
          // Container này quá cao sẽ gây overflow
          Container(
            width: double.infinity,
            height: 800, // Quá cao so với màn hình
            color: Colors.green,
            child: const Text('Container 3 - Gây lỗi'),
          ),
        ],
      ),
    );
  }
}

// ✅ CÁCH ĐÚNG - Dùng SingleChildScrollView hoặc Expanded
class CorrectLayout extends StatelessWidget {
  const CorrectLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đúng - Không bị lỗi')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.red,
              child: const Center(child: Text('Container 1')),
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.blue,
              child: const Center(child: Text('Container 2')),
            ),
            Container(
              width: double.infinity,
              height: 800,
              color: Colors.green,
              child: const Center(child: Text('Container 3 - Có thể cuộn')),
            ),
          ],
        ),
      ),
    );
  }
}
