import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class SpringAnimationDemo extends StatefulWidget {
  const SpringAnimationDemo({super.key});

  @override
  State<SpringAnimationDemo> createState() => _SpringAnimationDemoState();
}

class _SpringAnimationDemoState extends State<SpringAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _springAnimation;
  double _dragPosition = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _springAnimation = _controller.drive(Tween<double>(begin: 0, end: 300));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startSpringAnimation(double velocity) {
    // Tạo simulation lò xo
    const spring = SpringDescription(mass: 1, stiffness: 200, damping: 10);

    final simulation = SpringSimulation(
      spring,
      0, // start position
      300, // end position
      velocity, // initial velocity
    );

    _controller.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spring Animation Demo')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Kéo thả widget để thấy hiệu ứng lò xo',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _dragPosition += details.delta.dx;
                  _dragPosition = _dragPosition.clamp(0, 300);
                });
                _controller.stop();
              },
              onPanEnd: (details) {
                _startSpringAnimation(details.velocity.pixelsPerSecond.dx);
              },
              child: Stack(
                children: [
                  // Track
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    height: 4,
                    color: Colors.grey,
                  ),
                  // Draggable widget
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      final position = _controller.isAnimating
                          ? _springAnimation.value
                          : _dragPosition;
                      return Positioned(
                        left: 50 + position - 25,
                        top: 100,
                        child: GestureDetector(
                          onPanUpdate: (details) {
                            setState(() {
                              _dragPosition += details.delta.dx;
                              _dragPosition = _dragPosition.clamp(0, 300);
                            });
                            _controller.stop();
                          },
                          onPanEnd: (details) {
                            _startSpringAnimation(
                              details.velocity.pixelsPerSecond.dx,
                            );
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.drag_handle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
