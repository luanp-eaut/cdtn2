// lib/main.dart
import 'package:cdtn2/chapter_1/row_col_container.dart';
import 'package:cdtn2/chapter_1/stateful_widget.dart';
import 'package:cdtn2/chapter_1/stateless_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LayoutDemo(),
    );
  }
}
