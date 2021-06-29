import 'dart:math';

import 'package:flutter/material.dart';

class D20DiceRoller with ChangeNotifier {
  D20DiceRoller()
      : _number = 20,
        _isRollDone = true;

  static const _rotationCount = 20;

  late int _number;
  int get d20 => _number;
  set _d20(int value) {
    _number = value;
    notifyListeners();
  }

  late bool _isRollDone;
  bool get isDone => _isRollDone;
  set _isDone(bool value) {
    _isRollDone = value;
    notifyListeners();
  }

  void rollD20() {
    _isDone = false;
    for (int i = 0; i < _rotationCount; i++)
      Future.delayed(
        Duration(milliseconds: i * (i * 7)),
        () => _d20 = Random().nextInt(19) + 1,
      ).then(
        (value) => i == _rotationCount - 1 ? _isDone = true : null,
      );
  }
}
