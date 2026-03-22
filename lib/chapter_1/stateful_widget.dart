import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Bạn đã bấm: $_count lần', style: const TextStyle(fontSize: 20)),
        ElevatedButton(onPressed: _increment, child: const Text('Tăng số')),
      ],
    );
  }
}
