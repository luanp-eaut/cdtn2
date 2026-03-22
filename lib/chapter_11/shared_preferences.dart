import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({super.key});

  @override
  State<SharedPreferencesDemo> createState() => _SharedPreferencesDemoState();
}

class _SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  String _username = 'Guest';
  bool _isDarkMode = false;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? 'Guest';
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    setState(() {
      _username = username;
    });
  }

  Future<void> _toggleDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    final newValue = !_isDarkMode;
    await prefs.setBool('isDarkMode', newValue);
    setState(() {
      _isDarkMode = newValue;
    });
  }

  Future<void> _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    final newCounter = _counter + 1;
    await prefs.setInt('counter', newCounter);
    setState(() {
      _counter = newCounter;
    });
  }

  Future<void> _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      _username = 'Guest';
      _isDarkMode = false;
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shared Preferences Demo'),
          actions: [
            IconButton(onPressed: _clearData, icon: const Icon(Icons.delete)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Username: $_username',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Nhập username',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: _saveUsername,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Dark Mode', style: TextStyle(fontSize: 18)),
                  Switch(
                    value: _isDarkMode,
                    onChanged: (_) => _toggleDarkMode(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Counter', style: TextStyle(fontSize: 18)),
                  Row(
                    children: [
                      Text('$_counter', style: const TextStyle(fontSize: 24)),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _incrementCounter,
                        child: const Text('+'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
