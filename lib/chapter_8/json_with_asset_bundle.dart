import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class JsonAssetDemo extends StatefulWidget {
  const JsonAssetDemo({super.key});

  @override
  State<JsonAssetDemo> createState() => _JsonAssetDemoState();
}

class _JsonAssetDemoState extends State<JsonAssetDemo> {
  Map<String, dynamic>? _data;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      // Đọc file JSON từ assets
      final String jsonString = await rootBundle.loadString(
        'assets/data/config.json',
      );
      final Map<String, dynamic> data = json.decode(jsonString);

      setState(() {
        _data = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON Asset Demo')),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : _error != null
            ? Text('Lỗi: $_error')
            : _buildDataView(),
      ),
    );
  }

  Widget _buildDataView() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'App Name: ${_data?['app_name'] ?? 'N/A'}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text('Version: ${_data?['version'] ?? 'N/A'}'),
          const SizedBox(height: 10),
          Text('Theme: ${_data?['default_theme'] ?? 'N/A'}'),
        ],
      ),
    );
  }
}
