void main() {
  // String Interpolation
  String name = 'Sinh viên';
  int year = 2024;
  print('Chào $name'); // Chào Sinh viên
  print('Năm nay là ${year - 1}'); // Năm nay là 2023

  // Biến và kiểu dữ liệu
  var age = 20; // Dart tự suy luận là int
  String message = 'Học Dart';
  double pi = 3.14;
  bool isLearning = true;

  // Hằng số
  final currentTime = DateTime.now(); // Runtime
  const appName = 'Flutter App'; // Compile-time

  // Collections
  List<int> numbers = [1, 2, 3];
  Map<String, int> scores = {'Toán': 9, 'Lý': 8};
  Set<String> uniqueNames = {'An', 'Bình', 'An'}; // chỉ còn An, Bình

  print('Danh sách: $numbers');
  print('Điểm Toán: ${scores['Toán']}');
  print('Tên duy nhất: $uniqueNames');
}
