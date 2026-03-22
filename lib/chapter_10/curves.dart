import 'package:flutter/material.dart';

class CurvesDemo extends StatefulWidget {
  const CurvesDemo({super.key});

  @override
  State<CurvesDemo> createState() => _CurvesDemoState();
}

class _CurvesDemoState extends State<CurvesDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Curve _selectedCurve = Curves.easeInOut;
  double _value = 0;

  final Map<String, Curve> _curves = {
    'Linear': Curves.linear,
    'Ease In': Curves.easeIn,
    'Ease Out': Curves.easeOut,
    'Ease In Out': Curves.easeInOut,
    'Bounce In': Curves.bounceIn,
    'Bounce Out': Curves.bounceOut,
    'Elastic Out': Curves.elasticOut,
    'Decelerate': Curves.decelerate,
  };

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..addListener(() {
            setState(() {
              _value = _controller.value;
            });
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animate() {
    _controller.reset();
    _controller.animateTo(
      1.0,
      duration: const Duration(seconds: 2),
      curve: _selectedCurve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Curves Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Dropdown chọn curve
            DropdownButton<Curve>(
              value: _selectedCurve,
              isExpanded: true,
              items: _curves.entries.map((entry) {
                return DropdownMenuItem(
                  value: entry.value,
                  child: Text(entry.key),
                );
              }).toList(),
              onChanged: (curve) {
                if (curve != null) {
                  setState(() {
                    _selectedCurve = curve;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            // Hiển thị giá trị hiện tại
            LinearProgressIndicator(value: _value),
            const SizedBox(height: 10),
            Text('Progress: ${(_value * 100).toStringAsFixed(0)}%'),
            const SizedBox(height: 40),
            // Widget chạy animation
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Transform.translate(
                  offset: Offset(_value * 100, 0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '${(_value * 100).toInt()}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: _animate, child: const Text('Animate')),
          ],
        ),
      ),
    );
  }
}
