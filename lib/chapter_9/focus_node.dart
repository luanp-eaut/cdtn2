import 'package:flutter/material.dart';

class FocusNodeDemo extends StatefulWidget {
  const FocusNodeDemo({super.key});

  @override
  State<FocusNodeDemo> createState() => _FocusNodeDemoState();
}

class _FocusNodeDemoState extends State<FocusNodeDemo> {
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _nameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _closeKeyboard() {
    FocusScope.of(context).unfocus();
  }

  void _nextField(FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FocusNode Demo')),
      body: GestureDetector(
        onTap: _closeKeyboard,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                focusNode: _nameFocus,
                decoration: const InputDecoration(
                  labelText: 'Họ tên',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.next,
                onEditingComplete: () => _nextField(_nameFocus, _emailFocus),
              ),
              const SizedBox(height: 16),
              TextField(
                focusNode: _emailFocus,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onEditingComplete: () =>
                    _nextField(_emailFocus, _passwordFocus),
              ),
              const SizedBox(height: 16),
              TextField(
                focusNode: _passwordFocus,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mật khẩu',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.done,
                onEditingComplete: _closeKeyboard,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _closeKeyboard,
                child: const Text('Đóng bàn phím'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
