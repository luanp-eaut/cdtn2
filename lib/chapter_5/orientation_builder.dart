import 'package:flutter/material.dart';

class OrientationBuilderDemo extends StatelessWidget {
  const OrientationBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OrientationBuilder Demo')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            // Chế độ dọc
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone_android, size: 100),
                const SizedBox(height: 20),
                const Text('Chế độ DỌC', style: TextStyle(fontSize: 24)),
                const SizedBox(height: 10),
                const Text('Xoay ngang để xem layout khác'),
              ],
            );
          } else {
            // Chế độ ngang
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone_android, size: 80),
                const SizedBox(width: 20),
                const Icon(Icons.screen_rotation, size: 80),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Chế độ NGANG', style: TextStyle(fontSize: 24)),
                    Text('Layout đã thay đổi'),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
