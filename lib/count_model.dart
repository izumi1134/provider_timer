import 'dart:math';

import 'package:flutter/material.dart';

class CountModel extends ChangeNotifier {
  int counter = 0;
  List<Color> colorOptions = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];
  Color currentColor = Colors.black;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void updateColor() {
    currentColor = colorOptions[Random().nextInt(colorOptions.length)];
    notifyListeners();
  }
}
