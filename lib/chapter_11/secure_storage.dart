import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageDemo extends StatefulWidget {
  const SecureStorageDemo({super.key});

  @override
  State<SecureStorageDemo> createState() => _SecureStorageDemoState();
}

class _SecureStorageDemoState extends State<SecureStorageDemo> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final TextEditingController _tokenController = TextEditingController();
  String _storedToken = '';

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _saveToken() async {
    if (_tokenController.text.trim().isEmpty) return;

    await _storage.write(key: 'auth_token', value: _tokenController.text);
    _tokenController.clear();
    await _loadToken();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Token đã được lưu an toàn')),
      );
    }
  }

  Future<void> _loadToken() async {
    final token = await _storage.read(key: 'auth_token');
    setState(() {
      _storedToken = token ?? 'Chưa có token';
    });
  }

  Future<void> _deleteToken() async {
    await _storage.delete(key: 'auth_token');
    await _loadToken();

    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Đã xóa token')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secure Storage Demo'),
        actions: [
          IconButton(onPressed: _deleteToken, icon: const Icon(Icons.delete)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.security, size: 80, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              'Flutter Secure Storage',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Dữ liệu được mã hóa và lưu trong\nKeychain (iOS) / Keystore (Android)',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _tokenController,
              decoration: const InputDecoration(
                labelText: 'Nhập token',
                hintText: 'eyJhbGciOiJIUzI1NiIs...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.vpn_key),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveToken,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Lưu token an toàn'),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Token đã lưu:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _storedToken,
                    style: const TextStyle(fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
