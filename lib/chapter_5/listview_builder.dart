import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});

  final List<Map<String, dynamic>> _products = const [
    {'name': 'Áo thun', 'price': 250000, 'icon': Icons.checkroom},
    {'name': 'Quần jeans', 'price': 450000, 'icon': Icons.shopping_bag},
    {'name': 'Giày thể thao', 'price': 850000, 'icon': Icons.sports_soccer},
    {'name': 'Mũ', 'price': 150000, 'icon': Icons.emoji_people},
    {'name': 'Tất', 'price': 50000, 'icon': Icons.shopping_bag},
    {'name': 'Áo khoác', 'price': 650000, 'icon': Icons.checkroom},
    {'name': 'Kính mát', 'price': 350000, 'icon': Icons.visibility},
    {'name': 'Đồng hồ', 'price': 1250000, 'icon': Icons.watch},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView.builder Demo')),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(product['icon'], size: 40, color: Colors.blue),
              title: Text(
                product['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${product['price']} VNĐ'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Đã chọn ${product['name']}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
