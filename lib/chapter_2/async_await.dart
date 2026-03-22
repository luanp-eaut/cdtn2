// Future: giả lập gọi API
Future<String> fetchUserData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Dữ liệu người dùng đã tải';
}

// Stream: phát ra nhiều giá trị theo thời gian
Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    yield i;
  }
}

void main() async {
  print('Bắt đầu tải dữ liệu...');
  var result = await fetchUserData();
  print(result); // Sau 2 giây

  // Lắng nghe Stream
  await for (var value in countStream(5)) {
    print('Stream value: $value');
  }
  print('Kết thúc');
}
