import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Todo {
  final int? id;
  final String title;
  final int isCompleted; // 0 = false, 1 = true

  Todo({this.id, required this.title, this.isCompleted = 0});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'isCompleted': isCompleted};
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      isCompleted: map['isCompleted'],
    );
  }
}

class TodoDatabaseHelper {
  static final TodoDatabaseHelper instance = TodoDatabaseHelper._init();
  static Database? _database;

  TodoDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('todos.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        isCompleted INTEGER DEFAULT 0
      )
    ''');
  }

  // CRUD Operations
  Future<Todo> insert(Todo todo) async {
    final db = await database;
    final id = await db.insert('todos', todo.toMap());
    return Todo(id: id, title: todo.title, isCompleted: todo.isCompleted);
  }

  Future<List<Todo>> getAllTodos() async {
    final db = await database;
    final result = await db.query('todos', orderBy: 'id DESC');
    return result.map((map) => Todo.fromMap(map)).toList();
  }

  Future<List<Todo>> getActiveTodos() async {
    final db = await database;
    final result = await db.query(
      'todos',
      where: 'isCompleted = ?',
      whereArgs: [0],
      orderBy: 'id DESC',
    );
    return result.map((map) => Todo.fromMap(map)).toList();
  }

  Future<List<Todo>> getCompletedTodos() async {
    final db = await database;
    final result = await db.query(
      'todos',
      where: 'isCompleted = ?',
      whereArgs: [1],
      orderBy: 'id DESC',
    );
    return result.map((map) => Todo.fromMap(map)).toList();
  }

  Future<int> updateTodo(Todo todo) async {
    final db = await database;
    return await db.update(
      'todos',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<int> deleteTodo(int id) async {
    final db = await database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    final db = await database;
    return await db.delete('todos');
  }
}
