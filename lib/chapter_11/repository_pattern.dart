// models/user.dart
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class User {
  final int? id;
  final String username;
  final String email;

  User({this.id, required this.username, required this.email});

  Map<String, dynamic> toMap() {
    return {'id': id, 'username': username, 'email': email};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(id: map['id'], username: map['username'], email: map['email']);
  }
}

// repositories/user_repository.dart
class UserRepository {
  final Database _database;
  final FlutterSecureStorage _secureStorage;
  final SharedPreferences _prefs;

  UserRepository({
    required Database database,
    required FlutterSecureStorage secureStorage,
    required SharedPreferences prefs,
  }) : _database = database,
       _secureStorage = secureStorage,
       _prefs = prefs;

  // Lấy danh sách user từ SQLite
  Future<List<User>> getUsers() async {
    final result = await _database.query('users');
    return result.map((map) => User.fromMap(map)).toList();
  }

  // Thêm user
  Future<int> addUser(User user) async {
    return await _database.insert('users', user.toMap());
  }

  // Lưu token an toàn
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: 'auth_token', value: token);
  }

  // Lấy token
  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }

  // Lưu cài đặt
  Future<void> saveSettings({required bool isDarkMode}) async {
    await _prefs.setBool('isDarkMode', isDarkMode);
  }

  // Lấy cài đặt
  bool getDarkMode() {
    return _prefs.getBool('isDarkMode') ?? false;
  }
}

// Sử dụng Repository
class RepositoryDemo extends StatefulWidget {
  const RepositoryDemo({super.key});

  @override
  State<RepositoryDemo> createState() => _RepositoryDemoState();
}

class _RepositoryDemoState extends State<RepositoryDemo> {
  late UserRepository _repository;
  List<User> _users = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initRepository();
  }

  Future<void> _initRepository() async {
    // Khởi tạo các dependencies
    final prefs = await SharedPreferences.getInstance();
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(
      join(dbPath, 'app.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            email TEXT
          )
        ''');
      },
    );
    const secureStorage = FlutterSecureStorage();

    _repository = UserRepository(
      database: db,
      secureStorage: secureStorage,
      prefs: prefs,
    );

    await _loadUsers();
  }

  Future<void> _loadUsers() async {
    setState(() => _isLoading = true);
    final users = await _repository.getUsers();
    setState(() {
      _users = users;
      _isLoading = false;
    });
  }

  Future<void> _addUser() async {
    await _repository.addUser(
      User(
        username: 'user_${DateTime.now().millisecondsSinceEpoch}',
        email: 'user@example.com',
      ),
    );
    await _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Repository Pattern')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return ListTile(
                  title: Text(user.username),
                  subtitle: Text(user.email),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addUser,
        child: const Icon(Icons.add),
      ),
    );
  }
}
