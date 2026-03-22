// Model Todo
import 'package:flutter/material.dart';

class Todo {
  final String id;
  final String title;
  bool isCompleted;

  Todo({required this.id, required this.title, this.isCompleted = false});
}

// Model quản lý danh sách Todo
class TodoModel extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;
  List<Todo> get completedTodos => _todos.where((t) => t.isCompleted).toList();
  List<Todo> get activeTodos => _todos.where((t) => !t.isCompleted).toList();

  void addTodo(String title) {
    if (title.trim().isEmpty) return;
    _todos.add(Todo(id: DateTime.now().toString(), title: title));
    notifyListeners();
  }

  void toggleTodo(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].isCompleted = !_todos[index].isCompleted;
      notifyListeners();
    }
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
