import 'package:cdtn2/chapter_11/todo_sqlite.dart';
import 'package:flutter/material.dart';

class SQLiteTodoApp extends StatefulWidget {
  const SQLiteTodoApp({super.key});

  @override
  State<SQLiteTodoApp> createState() => _SQLiteTodoAppState();
}

class _SQLiteTodoAppState extends State<SQLiteTodoApp> {
  final TodoDatabaseHelper _dbHelper = TodoDatabaseHelper.instance;
  List<Todo> _todos = [];
  final TextEditingController _controller = TextEditingController();
  String _filter = 'all'; // all, active, completed

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    List<Todo> todos;
    if (_filter == 'active') {
      todos = await _dbHelper.getActiveTodos();
    } else if (_filter == 'completed') {
      todos = await _dbHelper.getCompletedTodos();
    } else {
      todos = await _dbHelper.getAllTodos();
    }
    setState(() {
      _todos = todos;
    });
  }

  Future<void> _addTodo() async {
    if (_controller.text.trim().isEmpty) return;

    final todo = Todo(title: _controller.text.trim());
    await _dbHelper.insert(todo);
    _controller.clear();
    await _loadTodos();
  }

  Future<void> _toggleTodo(Todo todo) async {
    final updatedTodo = Todo(
      id: todo.id,
      title: todo.title,
      isCompleted: todo.isCompleted == 0 ? 1 : 0,
    );
    await _dbHelper.updateTodo(updatedTodo);
    await _loadTodos();
  }

  Future<void> _deleteTodo(int id) async {
    await _dbHelper.deleteTodo(id);
    await _loadTodos();
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Đã xóa công việc')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite Todo App'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Nhập công việc...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _addTodo(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(onPressed: _addTodo, icon: const Icon(Icons.add)),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Filter buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFilterButton('Tất cả', 'all'),
                const SizedBox(width: 10),
                _buildFilterButton('Chưa làm', 'active'),
                const SizedBox(width: 10),
                _buildFilterButton('Đã làm', 'completed'),
              ],
            ),
          ),
          // Todo list
          Expanded(
            child: _todos.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.checklist, size: 80, color: Colors.grey),
                        SizedBox(height: 16),
                        Text('Không có công việc nào'),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _todos.length,
                    itemBuilder: (context, index) {
                      final todo = _todos[index];
                      return Dismissible(
                        key: Key(todo.id.toString()),
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (_) => _deleteTodo(todo.id!),
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          child: ListTile(
                            leading: Checkbox(
                              value: todo.isCompleted == 1,
                              onChanged: (_) => _toggleTodo(todo),
                            ),
                            title: Text(
                              todo.title,
                              style: TextStyle(
                                decoration: todo.isCompleted == 1
                                    ? TextDecoration.lineThrough
                                    : null,
                                color: todo.isCompleted == 1
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                              onPressed: () => _deleteTodo(todo.id!),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label, String filter) {
    return FilterChip(
      label: Text(label),
      selected: _filter == filter,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _filter = filter;
          });
          _loadTodos();
        }
      },
    );
  }
}
