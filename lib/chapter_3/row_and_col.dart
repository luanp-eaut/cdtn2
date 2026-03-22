import 'package:flutter/material.dart';

class RowColumnDemo extends StatelessWidget {
  const RowColumnDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row & Column Demo')),
      body: Column(
        children: [
          // Row: Sắp xếp ngang
          Container(
            color: Colors.blue.shade100,
            height: 100,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.star, size: 40, color: Colors.orange),
                Icon(Icons.favorite, size: 40, color: Colors.red),
                Icon(Icons.thumb_up, size: 40, color: Colors.green),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Column: Sắp xếp dọc
          Expanded(
            child: Container(
              color: Colors.green.shade100,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Dòng 1', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text('Dòng 2', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text('Dòng 3', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
