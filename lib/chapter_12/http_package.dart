import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpPackageDemo extends StatefulWidget {
  const HttpPackageDemo({super.key});

  @override
  State<HttpPackageDemo> createState() => _HttpPackageDemoState();
}

class _HttpPackageDemoState extends State<HttpPackageDemo> {
  List<dynamic> _posts = [];
  bool _isLoading = false;
  String _error = '';

  Future<void> _fetchPosts() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      if (response.statusCode == 200) {
        setState(() {
          _posts = json.decode(response.body);
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Lỗi: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Lỗi kết nối: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Package Demo'),
        actions: [
          IconButton(onPressed: _fetchPosts, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error.isNotEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_error, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _fetchPosts,
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            )
          : _posts.isEmpty
          ? const Center(child: Text('Nhấn nút refresh để tải dữ liệu'))
          : ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                final post = _posts[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(
                      post['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(post['body']),
                    leading: CircleAvatar(child: Text('${post['id']}')),
                  ),
                );
              },
            ),
    );
  }
}
