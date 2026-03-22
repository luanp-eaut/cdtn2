import 'package:flutter/material.dart';

void main() {
  runApp(const DarkModeApp());
}

class DarkModeApp extends StatefulWidget {
  const DarkModeApp({super.key});

  @override
  State<DarkModeApp> createState() => _DarkModeAppState();
}

class _DarkModeAppState extends State<DarkModeApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dark Mode Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      themeMode: _themeMode,
      home: DarkModeHomeScreen(
        onThemeToggle: _toggleTheme,
        currentMode: _themeMode,
      ),
    );
  }
}

class DarkModeHomeScreen extends StatelessWidget {
  final Function(bool) onThemeToggle;
  final ThemeMode currentMode;

  const DarkModeHomeScreen({
    super.key,
    required this.onThemeToggle,
    required this.currentMode,
  });

  bool get _isDarkMode =>
      currentMode == ThemeMode.dark ||
      (currentMode == ThemeMode.system &&
          WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark Mode Demo'),
        backgroundColor: colorScheme.primary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
              size: 80,
              color: colorScheme.primary,
            ),
            const SizedBox(height: 20),
            Text(
              _isDarkMode ? 'Chế độ tối' : 'Chế độ sáng',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            Text(
              'Màu sắc thay đổi theo theme',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => onThemeToggle(false),
                  child: const Text('Sáng'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => onThemeToggle(true),
                  child: const Text('Tối'),
                ),
                const SizedBox(width: 20),
                OutlinedButton(
                  onPressed: () => onThemeToggle(false),
                  child: const Text('Hệ thống'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
