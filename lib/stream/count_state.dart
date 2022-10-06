import 'dart:async';

class CountState {
  int _count = 0;
  int get count => _count;
  // Single - Subscription Stream: chỉ được phép đăng ký lắng nghe dữ liệu một lần
  final StreamController _counterController = StreamController<int>();
  Stream get counterStream => _counterController.stream;

  void increment() {
    _count++;
    // thông báo đẩy giá trị mới vào
    _counterController.sink.add(_count);
  }

  void dispose() {
    _counterController.close();
  }
}
