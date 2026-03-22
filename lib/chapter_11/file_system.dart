import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileSystemDemo extends StatefulWidget {
  const FileSystemDemo({super.key});

  @override
  State<FileSystemDemo> createState() => _FileSystemDemoState();
}

class _FileSystemDemoState extends State<FileSystemDemo> {
  final TextEditingController _controller = TextEditingController();
  String _savedContent = '';
  String _documentsPath = '';

  @override
  void initState() {
    super.initState();
    _loadPath();
    _readFile();
  }

  Future<void> _loadPath() async {
    final directory = await getApplicationDocumentsDirectory();
    setState(() {
      _documentsPath = directory.path;
    });
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/note.txt');
  }

  Future<void> _saveFile() async {
    if (_controller.text.trim().isEmpty) return;

    final file = await _getFile();
    await file.writeAsString(_controller.text);
    _controller.clear();
    await _readFile();

    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Đã lưu file')));
    }
  }

  Future<void> _readFile() async {
    try {
      final file = await _getFile();
      final content = await file.readAsString();
      setState(() {
        _savedContent = content;
      });
    } catch (e) {
      setState(() {
        _savedContent = 'Chưa có nội dung';
      });
    }
  }

  Future<void> _deleteFile() async {
    try {
      final file = await _getFile();
      await file.delete();
      await _readFile();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Đã xóa file')));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Lỗi: $e')));
    }
  }

  Future<void> _exportToFile(String content) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(
      '${directory.path}/export_${DateTime.now().millisecondsSinceEpoch}.txt',
    );
    await file.writeAsString(content);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Đã export: ${file.path}')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File System Demo'),
        actions: [
          IconButton(onPressed: _deleteFile, icon: const Icon(Icons.delete)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Documents Path: $_documentsPath',
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nhập nội dung',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _saveFile,
                    child: const Text('Lưu file'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _readFile,
                    child: const Text('Đọc file'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
                    'Nội dung đã lưu:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(_savedContent),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _exportToFile(_savedContent),
              child: const Text('Export nội dung ra file mới'),
            ),
          ],
        ),
      ),
    );
  }
}
