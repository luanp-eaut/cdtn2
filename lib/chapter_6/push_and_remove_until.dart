// Màn hình Home có nút Logout
import 'package:cdtn2/chapter_6/push_replacement.dart';
import 'package:flutter/material.dart';

class HomeScreenWithLogout extends StatelessWidget {
  const HomeScreenWithLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trang chủ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Chào mừng bạn đã đăng nhập!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Đăng xuất: xóa toàn bộ stack, chỉ giữ màn hình Login
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false, // Xóa tất cả route cũ
                );
              },
              child: const Text('Đăng xuất'),
            ),
          ],
        ),
      ),
    );
  }
}
