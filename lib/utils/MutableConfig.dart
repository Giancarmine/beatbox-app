import 'package:flutter/material.dart';

import '../config.dart';

class MutableConfig with ChangeNotifier {
  static bool _isFirstTime = true;

  MutableConfig() {
    if (box.containsKey('firstTime')) {
      _isFirstTime = box.get('firstTime');
    } else {
      box.put('firstTime', _isFirstTime);
    }
  }

  bool isFirstTime() {
    return _isFirstTime;
  }

  void afterFirstTime() {
    _isFirstTime = false;

    notifyListeners();
    box.put('firstTime', _isFirstTime);
  }

  void resetConfig() {
    _isFirstTime = true;

    notifyListeners();
    box.put('firstTime', _isFirstTime);
  }
}
