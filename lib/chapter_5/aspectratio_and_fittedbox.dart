import 'package:flutter/material.dart';

class AspectRatioDemo extends StatelessWidget {
  const AspectRatioDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AspectRatio & FittedBox Demo')),
      body: Column(
        children: [
          const Text('AspectRatio 16:9', style: TextStyle(fontSize: 18)),
          Container(
            width: double.infinity,
            color: Colors.grey.shade200,
            child: const AspectRatio(
              aspectRatio: 16 / 9,
              child: Center(
                child: Text('Tỷ lệ 16:9', style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'AspectRatio 1:1 (Hình vuông)',
            style: TextStyle(fontSize: 18),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey.shade200,
            child: const AspectRatio(
              aspectRatio: 1,
              child: Center(
                child: Text('Hình vuông', style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'FittedBox - Co giãn vừa khít',
            style: TextStyle(fontSize: 18),
          ),
          Container(
            width: 200,
            height: 50,
            color: Colors.blue,
            child: const FittedBox(
              fit: BoxFit.contain,
              child: Text(
                'Văn bản dài sẽ được co lại vừa khít',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
