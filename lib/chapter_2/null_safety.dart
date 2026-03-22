void main() {
  // Biến có thể null
  String? nullableName;
  print(nullableName?.length); // null (safe call)
  print(nullableName?.length ?? 0); // 0 (nếu null thì lấy 0)

  // Biến không thể null
  String nonNullableName = 'Dart';

  // late variable (khởi tạo muộn)
  late String description;
  description = 'Đây là mô tả';
  print(description);

  // Assertion operator (cẩn thận khi dùng)
  String? maybeName = 'Flutter';
  print(maybeName!.length); // 7 (chắc chắn không null)
}
