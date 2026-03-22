// Khai báo routes tập trung trong MaterialApp
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
      },
      onGenerateRoute: (settings) {
        // Xử lý route động
        if (settings.name == '/product') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) =>
                ProductDetailPage(id: args['id'], name: args['name']),
          );
        }
        return null;
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trang chủ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Điều hướng bằng tên route
                Navigator.pushNamed(context, '/about');
              },
              child: const Text('Giới thiệu'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/contact');
              },
              child: const Text('Liên hệ'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Truyền tham số với Named Route
                Navigator.pushNamed(
                  context,
                  '/product',
                  arguments: {'id': 123, 'name': 'Sản phẩm đặc biệt'},
                );
              },
              child: const Text('Xem sản phẩm'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Giới thiệu')),
      body: const Center(child: Text('Ứng dụng Flutter demo về Navigation')),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liên hệ')),
      body: const Center(child: Text('Email: demo@example.com')),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final int id;
  final String name;

  const ProductDetailPage({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chi tiết: $name')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('ID: $id'), Text('Tên: $name')],
        ),
      ),
    );
  }
}
