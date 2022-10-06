import 'dart:async';

class CountState {
  int _count = 0;
  int get count => _count;
  // Broadcast Streams cho phép nhiều chỗ có thể lắng nghe sự kiện thay đổi dữ liệu của Stream
  final StreamController _counterController = StreamController<int>.broadcast();
  Stream get counterStream => _counterController.stream.transform(_counterTransformer);

  final _counterTransformer = StreamTransformer<int, int>.fromHandlers(handleData: (data, sink) {
    data += 5;
    sink.add(data);
  });

  void increment() {
    _count++;
    // thông báo đẩy giá trị mới vào
    _counterController.sink.add(_count);
  }

  void dispose() {
    _counterController.close();
  }
}
