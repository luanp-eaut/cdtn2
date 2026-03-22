// Màn hình chính - chờ kết quả trả về
import 'package:flutter/material.dart';

class SelectColorScreen extends StatelessWidget {
  const SelectColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chọn màu sắc')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Chờ kết quả từ màn hình chọn màu
            final selectedColor = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ColorPickerScreen(),
              ),
            );

            // Hiển thị kết quả
            if (selectedColor != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Bạn đã chọn màu: $selectedColor')),
              );
            }
          },
          child: const Text('Chọn màu sắc'),
        ),
      ),
    );
  }
}

// Màn hình chọn màu - trả về kết quả
class ColorPickerScreen extends StatelessWidget {
  const ColorPickerScreen({super.key});

  final List<Map<String, dynamic>> _colors = const [
    {'name': 'Đỏ', 'value': 'Red'},
    {'name': 'Xanh', 'value': 'Blue'},
    {'name': 'Vàng', 'value': 'Yellow'},
    {'name': 'Xanh lá', 'value': 'Green'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chọn màu')),
      body: ListView.builder(
        itemCount: _colors.length,
        itemBuilder: (context, index) {
          final color = _colors[index];
          return ListTile(
            title: Text(color['name']),
            onTap: () {
              // Trả về giá trị đã chọn và pop màn hình
              Navigator.pop(context, color['value']);
            },
          );
        },
      ),
    );
  }
}
