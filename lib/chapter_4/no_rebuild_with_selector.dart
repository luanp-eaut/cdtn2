// Sử dụng Selector để chỉ rebuild khi giá trị cụ thể thay đổi
import 'package:cdtn2/chapter_4/model/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptimizedCounterScreen extends StatelessWidget {
  const OptimizedCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Optimized Provider')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Chỉ rebuild khi count thay đổi
            Selector<CounterModel, int>(
              selector: (_, model) => model.count,
              builder: (_, count, __) {
                return Text('$count', style: const TextStyle(fontSize: 48));
              },
            ),
            // Phần này không rebuild khi count thay đổi
            const Text('Phần UI tĩnh'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterModel>().increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
