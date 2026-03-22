import 'package:flutter/material.dart';

class ThemeAccessDemo extends StatelessWidget {
  const ThemeAccessDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy theme hiện tại
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Access Demo'),
        backgroundColor: colorScheme.primary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Sử dụng màu từ theme
            Container(
              width: 100,
              height: 100,
              color: colorScheme.secondary,
              child: const Center(child: Text('Secondary')),
            ),
            const SizedBox(height: 20),
            // Sử dụng text style từ theme
            Text(
              'Primary Color Text',
              style: textTheme.titleLarge?.copyWith(color: colorScheme.primary),
            ),
            const SizedBox(height: 20),
            // Sử dụng màu error
            Text('Error Message', style: TextStyle(color: colorScheme.error)),
            const SizedBox(height: 20),
            // Sử dụng màu surface
            Container(
              padding: const EdgeInsets.all(16),
              color: colorScheme.surface,
              child: Text(
                'Surface Color',
                style: TextStyle(color: colorScheme.onSurface),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
