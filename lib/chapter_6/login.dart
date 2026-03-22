import 'package:flutter/material.dart';

void main() {
  runApp(const LoginFlowApp());
}

class LoginFlowApp extends StatelessWidget {
  const LoginFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Flow Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginFlowScreen(),
    );
  }
}

class LoginFlowScreen extends StatefulWidget {
  const LoginFlowScreen({super.key});

  @override
  State<LoginFlowScreen> createState() => _LoginFlowScreenState();
}

class _LoginFlowScreenState extends State<LoginFlowScreen> {
  bool _isLoggedIn = false;
  String _username = '';

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn) {
      return HomeFlowScreen(
        username: _username,
        onLogout: () {
          setState(() {
            _isLoggedIn = false;
            _username = '';
          });
        },
      );
    }
    return LoginFormScreen(
      onLogin: (username) {
        setState(() {
          _isLoggedIn = true;
          _username = username;
        });
      },
    );
  }
}

class LoginFormScreen extends StatelessWidget {
  final Function(String) onLogin;

  const LoginFormScreen({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Đăng nhập')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Tên đăng nhập'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Mật khẩu'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (usernameController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  onLogin(usernameController.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Vui lòng nhập đầy đủ thông tin'),
                    ),
                  );
                }
              },
              child: const Text('Đăng nhập'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeFlowScreen extends StatelessWidget {
  final String username;
  final VoidCallback onLogout;

  const HomeFlowScreen({
    super.key,
    required this.username,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
        actions: [
          IconButton(onPressed: onLogout, icon: const Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chào mừng $username!', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsFlowScreen(),
                  ),
                );
              },
              child: const Text('Cài đặt'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsFlowScreen extends StatelessWidget {
  const SettingsFlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cài đặt')),
      body: const Center(child: Text('Đây là màn hình cài đặt')),
    );
  }
}
