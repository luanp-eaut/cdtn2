import 'package:flutter/material.dart';

class LifecycleDemo extends StatefulWidget {
  const LifecycleDemo({super.key});

  @override
  State<LifecycleDemo> createState() => _LifecycleDemoState();
}

class _LifecycleDemoState extends State<LifecycleDemo> {
  String _message = 'Khởi tạo';

  @override
  void initState() {
    super.initState();
    print('1. initState - Widget được chèn vào cây');
    _message = 'initState đã chạy';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('2. didChangeDependencies - Phụ thuộc thay đổi');
  }

  @override
  void didUpdateWidget(covariant LifecycleDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('3. didUpdateWidget - Widget cha cập nhật');
  }

  @override
  void dispose() {
    print('4. dispose - Widget bị xóa khỏi cây');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('5. build - Xây dựng giao diện');
    return Scaffold(
      appBar: AppBar(title: const Text('Lifecycle Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_message, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _message = 'setState đã được gọi';
                });
              },
              child: const Text('Gọi setState'),
            ),
          ],
        ),
      ),
    );
  }
}
