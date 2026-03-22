// Màn hình danh sách sản phẩm
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  final List<Map<String, dynamic>> _products = const [
    {'id': 1, 'name': 'Áo thun', 'price': 250000},
    {'id': 2, 'name': 'Quần jeans', 'price': 450000},
    {'id': 3, 'name': 'Giày thể thao', 'price': 850000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách sản phẩm')),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return ListTile(
            title: Text(product['name']),
            subtitle: Text('${product['price']} VNĐ'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Truyền dữ liệu qua constructor
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    id: product['id'],
                    name: product['name'],
                    price: product['price'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Màn hình chi tiết nhận dữ liệu qua constructor
class ProductDetailScreen extends StatelessWidget {
  final int id;
  final String name;
  final int price;

  const ProductDetailScreen({
    super.key,
    required this.id,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chi tiết: $name')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: $id', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Tên: $name', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Giá: $price VNĐ', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
