import 'package:flutter/material.dart';

class ExpandedFlexibleDemo extends StatelessWidget {
  const ExpandedFlexibleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expanded & Flexible Demo')),
      body: Column(
        children: [
          // Expanded: chiếm hết không gian còn lại
          const Text('Expanded (tight)'),
          Container(
            height: 100,
            color: Colors.grey.shade200,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    child: const Center(child: Text('flex: 2')),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blue,
                    child: const Center(child: Text('flex: 1')),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                    child: const Center(child: Text('flex: 1')),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Flexible: có thể nhỏ hơn không gian còn lại
          const Text('Flexible (loose)'),
          Container(
            height: 100,
            color: Colors.grey.shade200,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    child: const Center(child: Text('flex: 2')),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.blue,
                    child: const Center(child: Text('flex: 1')),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                    child: const Center(child: Text('flex: 1')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
