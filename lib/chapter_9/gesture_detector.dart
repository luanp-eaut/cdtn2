import 'package:flutter/material.dart';

class GestureDetectorDemo extends StatefulWidget {
  const GestureDetectorDemo({super.key});

  @override
  State<GestureDetectorDemo> createState() => _GestureDetectorDemoState();
}

class _GestureDetectorDemoState extends State<GestureDetectorDemo> {
  String _lastGesture = 'Chưa có cử chỉ';
  Color _boxColor = Colors.blue;
  double _scale = 1.0;
  Offset _position = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GestureDetector Demo')),
      body: Column(
        children: [
          // Kết quả hiển thị
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.grey.shade100,
            child: Text(
              'Cử chỉ cuối: $_lastGesture',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () => _updateGesture('Tap (Chạm)'),
                onDoubleTap: () => _updateGesture('Double Tap (Chạm 2 lần)'),
                onLongPress: () => _updateGesture('Long Press (Nhấn giữ)'),
                onTapDown: (details) => _updateGesture(
                  'Tap Down tại (${details.localPosition.dx.toInt()}, ${details.localPosition.dy.toInt()})',
                ),
                onTapUp: (details) => _updateGesture('Tap Up'),
                onPanUpdate: (details) {
                  setState(() {
                    _position += details.delta;
                  });
                  _updateGesture(
                    'Pan: (${_position.dx.toInt()}, ${_position.dy.toInt()})',
                  );
                },
                onScaleUpdate: (details) {
                  setState(() {
                    _scale = details.scale;
                  });
                  _updateGesture('Scale: ${_scale.toStringAsFixed(2)}x');
                },
                child: Transform.scale(
                  scale: _scale,
                  child: Transform.translate(
                    offset: _position,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: _boxColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(5, 5),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Chạm vào tôi',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _position = Offset.zero;
                      _scale = 1.0;
                      _boxColor = Colors.blue;
                    });
                  },
                  child: const Text('Reset'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _boxColor = Colors.red;
                    });
                  },
                  child: const Text('Đổi màu'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _updateGesture(String gesture) {
    setState(() {
      _lastGesture = gesture;
    });
  }
}
