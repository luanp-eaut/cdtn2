import 'package:flutter/material.dart';

class ExplicitAnimationDemo extends StatefulWidget {
  const ExplicitAnimationDemo({super.key});

  @override
  State<ExplicitAnimationDemo> createState() => _ExplicitAnimationDemoState();
}

class _ExplicitAnimationDemoState extends State<ExplicitAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    // Khởi tạo Controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this, // BẮT BUỘC: đồng bộ với màn hình
    );

    // Tween cho scale
    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    // Tween cho màu sắc
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Lắng nghe trạng thái hoàn thành
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        debugPrint('Animation hoàn thành');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // BẮT BUỘC: giải phóng bộ nhớ
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explicit Animation Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: _colorAnimation.value,
                    child: const Center(
                      child: Text(
                        'Scale',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _controller.forward(),
                  child: const Text('Forward'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _controller.reverse(),
                  child: const Text('Reverse'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _controller.reset(),
                  child: const Text('Reset'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _controller.repeat(),
                  child: const Text('Repeat'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Value: ${_controller.value.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
