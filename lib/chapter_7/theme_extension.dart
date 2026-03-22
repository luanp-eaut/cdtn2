// lib/extensions/theme_extension.dart
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Màu sắc thông dụng
  Color get primaryColor => colorScheme.primary;
  Color get secondaryColor => colorScheme.secondary;
  Color get errorColor => colorScheme.error;
  Color get surfaceColor => colorScheme.surface;
  Color get backgroundColor => colorScheme.surface;

  // Kiểu chữ thông dụng
  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get labelLarge => textTheme.labelLarge;
}

// Sử dụng extension
class ExtensionDemo extends StatelessWidget {
  const ExtensionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extension Demo'),
        backgroundColor: context.primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Headline từ extension', style: context.headlineLarge),
            const SizedBox(height: 20),
            Text('Body từ extension', style: context.bodyLarge),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              color: context.secondaryColor,
              child: Text(
                'Secondary Color',
                style: context.bodyLarge?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
