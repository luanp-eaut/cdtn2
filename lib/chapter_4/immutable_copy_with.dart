// Model bất biến (Immutable)
import 'package:flutter/material.dart';

@immutable
class UserState {
  final String name;
  final int age;
  final bool isLoading;

  const UserState({
    required this.name,
    required this.age,
    required this.isLoading,
  });

  // copyWith để tạo đối tượng mới từ đối tượng cũ
  UserState copyWith({String? name, int? age, bool? isLoading}) {
    return UserState(
      name: name ?? this.name,
      age: age ?? this.age,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// ChangeNotifier với Immutability
class UserModel extends ChangeNotifier {
  UserState _state = const UserState(name: 'Guest', age: 0, isLoading: false);

  UserState get state => _state;

  void updateName(String newName) {
    _state = _state.copyWith(name: newName);
    notifyListeners();
  }

  void startLoading() {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
  }
}
