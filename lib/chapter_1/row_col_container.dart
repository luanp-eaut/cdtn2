import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Layout Demo')),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: 100,
            width: double.infinity,
            child: const Center(child: Text('Hàng ngang 1')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.thumb_up),
              Icon(Icons.favorite),
              Icon(Icons.share),
            ],
          ),
          Container(
            color: Colors.green,
            height: 100,
            width: double.infinity,
            child: const Center(child: Text('Hàng ngang 2')),
          ),
        ],
      ),
    );
  }
}
