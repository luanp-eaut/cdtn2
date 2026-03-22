import 'package:cdtn2/chapter_3/basic_stateless_widget.dart';
import 'package:cdtn2/chapter_3/list_view_builder.dart';
import 'package:cdtn2/chapter_3/stateful_with_lifecycle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ListViewDemo(),
    );
  }
}
