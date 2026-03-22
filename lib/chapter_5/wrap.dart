import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget {
  const WrapDemo({super.key});

  final List<String> _tags = const [
    'Flutter',
    'Dart',
    'Mobile',
    'Web',
    'Desktop',
    'iOS',
    'Android',
    'UI/UX',
    'Responsive',
    'Animation',
    'State Management',
    'Firebase',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wrap Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Danh sách tags:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8, // Khoảng cách ngang
              runSpacing: 8, // Khoảng cách dọc
              children: _tags.map((tag) {
                return Chip(
                  label: Text(tag),
                  backgroundColor: Colors.blue.shade100,
                  avatar: const Icon(Icons.tag, size: 16),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
