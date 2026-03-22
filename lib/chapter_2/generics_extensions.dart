// Generics
class Box<T> {
  T content;
  Box(this.content);

  void display() {
    print('Nội dung: $content (${T})');
  }
}

// Extensions
extension StringExtension on String {
  bool isValidEmail() {
    return contains('@') && contains('.');
  }

  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

void main() {
  // Generics
  var stringBox = Box<String>('Xin chào');
  var intBox = Box<int>(123);
  stringBox.display(); // Nội dung: Xin chào (String)
  intBox.display(); // Nội dung: 123 (int)

  // Extensions
  String email = 'test@example.com';
  print(email.isValidEmail()); // true

  String name = 'flutter';
  print(name.capitalize()); // Flutter
}
