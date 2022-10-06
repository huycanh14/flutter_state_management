import 'package:rxdart/rxdart.dart';

class CountState {
  int _count = 0;
  int _countBehavior = 0;
  List<int> _countReplaySubject = [];
  int get count => _count;
  int get countBehavior => _countBehavior;
  late PublishSubject<int> _publishSubject;
  late BehaviorSubject<int> _behaviorSubject;
  late ReplaySubject<List<int>> _replaySubject;
  CountState() {
    _publishSubject = PublishSubject<int>();
    _behaviorSubject = BehaviorSubject<int>.seeded(1);
    _replaySubject = ReplaySubject<List<int>>();
  }
  Stream<int> get counterStream => _publishSubject.stream; // Observable
  Stream<int> get counterBehaviorStream => _behaviorSubject.stream;
  Stream<List<int>> get counterReplayStream => _replaySubject.stream;

  void increment() {
    _count++;
    _countBehavior++;
    _countReplaySubject.add(_count);
    // thông báo đẩy giá trị mới vào
    _publishSubject.add(_count);
    _behaviorSubject.add(_countBehavior);
    _replaySubject.add(_countReplaySubject);
    counterReplayStream.listen((event) {
      print('counterReplayStream' + event.toString());
      print('---------------');
    });
  }

  void dispose() {
    _publishSubject.close();
    _behaviorSubject.close();
  }
}
