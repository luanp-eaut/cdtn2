import 'package:flutter/material.dart';

class DraggableDemo extends StatefulWidget {
  const DraggableDemo({super.key});

  @override
  State<DraggableDemo> createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  Color _targetColor = Colors.grey.shade300;
  String _dragResult = 'Kéo thả item vào đây';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Draggable Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Kéo thả các item vào ô bên dưới',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Các item có thể kéo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDraggable('Đỏ', Colors.red),
                _buildDraggable('Xanh', Colors.blue),
                _buildDraggable('Vàng', Colors.orange),
                _buildDraggable('Lục', Colors.green),
              ],
            ),
            const SizedBox(height: 40),
            // Vùng thả
            DragTarget<String>(
              onAccept: (data) {
                setState(() {
                  _targetColor = _getColorFromName(data);
                  _dragResult = 'Đã thả: $data';
                });
              },
              onWillAccept: (data) => true,
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: _targetColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: candidateData.isNotEmpty
                          ? Colors.green
                          : Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _dragResult,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDraggable(String name, Color color) {
    return Draggable<String>(
      data: name,
      feedback: Material(
        color: Colors.transparent,
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5)],
          ),
          child: Center(
            child: Text(name, style: const TextStyle(color: Colors.white)),
          ),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: _buildDraggableItem(name, color),
      ),
      child: _buildDraggableItem(name, color),
    );
  }

  Widget _buildDraggableItem(String name, Color color) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(name, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Color _getColorFromName(String name) {
    switch (name) {
      case 'Đỏ':
        return Colors.red;
      case 'Xanh':
        return Colors.blue;
      case 'Vàng':
        return Colors.orange;
      case 'Lục':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
