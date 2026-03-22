import 'package:flutter/material.dart';

class ScrollViewDemo extends StatelessWidget {
  const ScrollViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SingleChildScrollView Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTextField('Họ và tên'),
            _buildTextField('Email'),
            _buildTextField('Số điện thoại'),
            _buildTextField('Địa chỉ'),
            _buildTextField('Ghi chú'),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text('Đăng ký')),
            const SizedBox(height: 20),
            ...List.generate(10, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('Nội dung thêm dòng ${index + 1}'),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
