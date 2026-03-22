import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

// Định nghĩa router
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePageNew(),
    ),
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (context, state) => const AboutPageNew(),
    ),
    GoRoute(
      path: '/product/:id',
      name: 'product',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ProductDetailPageNew(id: id);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GoRouter Demo',
      routerConfig: router,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class HomePageNew extends StatelessWidget {
  const HomePageNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trang chủ - GoRouter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Điều hướng bằng tên route
                context.goNamed('about');
              },
              child: const Text('Giới thiệu'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Điều hướng với tham số URL
                context.go('/product/123');
              },
              child: const Text('Xem sản phẩm 123'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPageNew extends StatelessWidget {
  const AboutPageNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Giới thiệu - GoRouter')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Quay lại
            context.pop();
          },
          child: const Text('Quay lại'),
        ),
      ),
    );
  }
}

class ProductDetailPageNew extends StatelessWidget {
  final String id;

  const ProductDetailPageNew({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sản phẩm #$id')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chi tiết sản phẩm ID: $id'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Quay lại'),
            ),
          ],
        ),
      ),
    );
  }
}
