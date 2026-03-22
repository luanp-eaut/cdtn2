import 'package:flutter/material.dart';

class DragAndDismissibleDemo extends StatefulWidget {
  const DragAndDismissibleDemo({super.key});

  @override
  State<DragAndDismissibleDemo> createState() => _DragAndDismissibleDemoState();
}

class _DragAndDismissibleDemoState extends State<DragAndDismissibleDemo> {
  final List<String> _items = List.generate(10, (index) => 'Item ${index + 1}');

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Đã xóa ${_items[index]}')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dismissible Demo')),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Dismissible(
            key: Key(item),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              _removeItem(index);
            },
            child: ListTile(
              leading: const Icon(Icons.drag_handle),
              title: Text(item),
              trailing: const Icon(Icons.swipe),
            ),
          );
        },
      ),
    );
  }
}
