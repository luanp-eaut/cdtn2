// Hàm với tham số bắt buộc
int add(int a, int b) {
  return a + b;
}

// Hàm với tham số tùy chọn theo vị trí
String greet(String name, [String? title]) {
  return title != null ? 'Xin chào $title $name' : 'Xin chào $name';
}

// Hàm với tham số đặt tên (quan trọng trong Flutter)
void createUser({required String name, int age = 18, String? email}) {
  print('Tên: $name, Tuổi: $age, Email: $email');
}

void main() {
  print(add(5, 3)); // 8

  print(greet('An')); // Xin chào An
  print(greet('An', 'ThS')); // Xin chào ThS An

  createUser(
    name: 'Nguyễn Văn A',
    age: 20,
  ); // Tên: Nguyễn Văn A, Tuổi: 20, Email: null
  createUser(
    name: 'Trần Thị B',
    email: 'b@example.com',
  ); // Tên: Trần Thị B, Tuổi: 18, Email: b@example.com
}
