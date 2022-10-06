import 'package:flutter/foundation.dart';

// Dùng DiagnosticableTreeMixin để có thể debug (Devtools) các thuộc tính cần theo dõi, không bắt buộc dùng DiagnosticableTreeMixin
class CountState with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  int _countRead = 0;
  int get count => _count;
  int get countRead => _countRead;

  void increment() {
    _count++;
    _countRead++;
    // thong cao co su thay doi
    notifyListeners();
  }

  // Làm cho `Counter` có thể đọc được bên trong devtools bằng cách liệt kê tất cả các thuộc tính của nó.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}
