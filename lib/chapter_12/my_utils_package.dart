// Tạo package: flutter create --template=package my_utils

// lib/my_utils.dart
library my_utils;

import 'package:flutter/material.dart';

// Extension tiện ích
extension StringExtension on String {
  bool isValidEmail() {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension DateExtension on DateTime {
  String formatDDMMYYYY() {
    return '$day/${month.toString().padLeft(2, '0')}/$year';
  }
}

// Widget tiện ích
class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}

// Sử dụng package trong project
// 1. Thêm dependency vào pubspec.yaml:
// dependencies:
//   my_utils:
//     path: ../my_utils

// 2. Import và sử dụng:
// import 'package:my_utils/my_utils.dart';
//
// 'email@example.com'.isValidEmail(); // true
// 'flutter'.capitalize(); // Flutter
// DateTime.now().formatDDMMYYYY(); // 21/03/2024
