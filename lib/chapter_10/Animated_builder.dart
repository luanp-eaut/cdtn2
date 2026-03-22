// ❌ CÁCH SAI - Gây rebuild toàn bộ widget
import 'package:flutter/material.dart';

class BadAnimation extends StatefulWidget {
  const BadAnimation({super.key});

  @override
  State<BadAnimation> createState() => _BadAnimationState();
}

class _BadAnimationState extends State<BadAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..addListener(() {
            setState(() {}); // ❌ Rebuild toàn bộ widget mỗi frame
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bad Animation')),
      body: Center(
        child: Column(
          children: [
            // Cả Column này bị rebuild 60 lần/giây
            Transform.scale(
              scale: _controller.value,
              child: const FlutterLogo(size: 100),
            ),
            const Text('Phần text tĩnh cũng bị rebuild không cần thiết'),
            ElevatedButton(
              onPressed: () => _controller.forward(),
              child: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ CÁCH ĐÚNG - Dùng AnimatedBuilder
class GoodAnimation extends StatefulWidget {
  const GoodAnimation({super.key});

  @override
  State<GoodAnimation> createState() => _GoodAnimationState();
}

class _GoodAnimationState extends State<GoodAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Good Animation')),
      body: Center(
        child: Column(
          children: [
            // Chỉ phần này được rebuild khi animation chạy
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(scale: _controller.value, child: child);
              },
              child: const FlutterLogo(size: 100), // Widget con không rebuild
            ),
            const Text('Phần text tĩnh KHÔNG bị rebuild'),
            ElevatedButton(
              onPressed: () => _controller.forward(),
              child: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}
