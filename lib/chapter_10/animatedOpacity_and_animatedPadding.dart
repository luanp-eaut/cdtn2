import 'package:flutter/material.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  const AnimatedOpacityDemo({super.key});

  @override
  State<AnimatedOpacityDemo> createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {
  double _opacity = 1.0;
  double _padding = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Opacity & Padding')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _opacity,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.blue,
                child: const Center(
                  child: Text('Fade', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedPadding(
              duration: const Duration(milliseconds: 500),
              padding: EdgeInsets.all(_padding),
              child: Container(
                width: 150,
                height: 150,
                color: Colors.green,
                child: const Center(
                  child: Text('Padding', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _opacity = _opacity == 1.0 ? 0.2 : 1.0;
                    });
                  },
                  child: const Text('Toggle Opacity'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _padding = _padding == 16 ? 50 : 16;
                    });
                  },
                  child: const Text('Toggle Padding'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
