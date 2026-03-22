import 'package:flutter/material.dart';

class LayoutBuilderDemo extends StatelessWidget {
  const LayoutBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LayoutBuilder Demo')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Kiểm tra chiều rộng có sẵn
          if (constraints.maxWidth > 600) {
            // Màn hình lớn (Tablet/Desktop) - 2 cột
            return Row(
              children: [
                Expanded(flex: 1, child: _buildMenu()),
                Expanded(flex: 3, child: _buildContent()),
              ],
            );
          } else {
            // Màn hình nhỏ (Mobile) - 1 cột
            return Column(
              children: [
                _buildMenu(),
                Expanded(child: _buildContent()),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildMenu() {
    return Container(
      color: Colors.blue.shade100,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          ListTile(title: Text('Trang chủ')),
          ListTile(title: Text('Sản phẩm')),
          ListTile(title: Text('Giới thiệu')),
          ListTile(title: Text('Liên hệ')),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Center(
        child: Text(
          'Nội dung chính\nLayout tự động thay đổi theo kích thước màn hình',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
