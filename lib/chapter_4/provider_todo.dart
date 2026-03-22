import 'package:cdtn2/chapter_4/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Nhập công việc mới...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      context.read<TodoModel>().addTodo(_controller.text);
                      _controller.clear();
                    }
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Consumer<TodoModel>(
        builder: (context, model, child) {
          if (model.todos.isEmpty) {
            return const Center(
              child: Text('Chưa có công việc nào. Thêm công việc mới!'),
            );
          }
          return ListView.builder(
            itemCount: model.todos.length,
            itemBuilder: (context, index) {
              final todo = model.todos[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: ListTile(
                  leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (_) => model.toggleTodo(todo.id),
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => model.deleteTodo(todo.id),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

final _controller = TextEditingController();
