// Màn hình danh sách
import 'package:flutter/material.dart';

class HeroListScreen extends StatelessWidget {
  const HeroListScreen({super.key});

  final List<Map<String, dynamic>> _items = const [
    {'id': 1, 'name': 'Flutter', 'color': Colors.blue},
    {'id': 2, 'name': 'Dart', 'color': Colors.green},
    {'id': 3, 'name': 'Animation', 'color': Colors.orange},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Animation')),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HeroDetailScreen(
                    id: item['id'],
                    name: item['name'],
                    color: item['color'],
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: item['color'].withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Hero(
                    tag: 'hero_${item['id']}',
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: item['color'],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.star, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    item['name'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Màn hình chi tiết
class HeroDetailScreen extends StatelessWidget {
  final int id;
  final String name;
  final Color color;

  const HeroDetailScreen({
    super.key,
    required this.id,
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name), backgroundColor: color),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'hero_$id',
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                child: const Icon(Icons.star, size: 80, color: Colors.white),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              name,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Đây là màn hình chi tiết\nHero Animation giúp widget "bay" mượt mà',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
