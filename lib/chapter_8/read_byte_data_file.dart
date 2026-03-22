import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ByteDataDemo extends StatelessWidget {
  const ByteDataDemo({super.key});

  Future<void> _loadBinaryFile() async {
    try {
      // Đọc file dạng byte
      final ByteData data = await rootBundle.load('assets/images/logo.png');
      final int sizeInBytes = data.lengthInBytes;
      final int sizeInKB = sizeInBytes ~/ 1024;

      debugPrint('Kích thước file: $sizeInKB KB');
    } catch (e) {
      debugPrint('Lỗi: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ByteData Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _loadBinaryFile();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Đã kiểm tra kích thước file (xem console)'),
              ),
            );
          },
          child: const Text('Kiểm tra kích thước ảnh'),
        ),
      ),
    );
  }
}
