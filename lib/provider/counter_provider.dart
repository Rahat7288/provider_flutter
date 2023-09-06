import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  var _count = 0;

  int get counter => _count;

  void increment() {
    _count += 1;
    notifyListeners();
  }

  void decrement() {
    _count -= 1;
    notifyListeners();
  }
}
