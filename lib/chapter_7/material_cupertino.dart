import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Material Design App
class MaterialAppDemo extends StatelessWidget {
  const MaterialAppDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('Material Design')),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite, size: 50, color: Colors.red),
              SizedBox(height: 10),
              Text('Material Design - Google'),
              SizedBox(height: 10),
              ElevatedButton(onPressed: null, child: Text('Button')),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

// Cupertino App (iOS Style)
class CupertinoAppDemo extends StatelessWidget {
  const CupertinoAppDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Cupertino App',
      theme: const CupertinoThemeData(primaryColor: CupertinoColors.systemBlue),
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Cupertino Design'),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.heart_fill,
                size: 50,
                color: CupertinoColors.systemRed,
              ),
              const SizedBox(height: 10),
              const Text('Cupertino Design - Apple'),
              const SizedBox(height: 10),
              CupertinoButton(
                onPressed: () {},
                color: CupertinoColors.systemBlue,
                child: const Text('Button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Adaptive Widget (tự động chọn theo nền tảng)
class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adaptive Widget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Switch adaptive
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Switch: '),
                Switch.adaptive(value: true, onChanged: (value) {}),
              ],
            ),
            const SizedBox(height: 20),
            // Progress indicator adaptive
            if (Theme.of(context).platform == TargetPlatform.iOS)
              const CupertinoActivityIndicator()
            else
              const CircularProgressIndicator(),
            const SizedBox(height: 20),
            // Button adaptive
            if (Theme.of(context).platform == TargetPlatform.iOS)
              CupertinoButton(
                onPressed: () {},
                child: const Text('Cupertino Button'),
              )
            else
              ElevatedButton(
                onPressed: () {},
                child: const Text('Material Button'),
              ),
          ],
        ),
      ),
    );
  }
}
