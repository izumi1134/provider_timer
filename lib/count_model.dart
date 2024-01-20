import 'package:flutter/cupertino.dart';

class CountModel extends ChangeNotifier {
  int counter = 0;
  int secondCounter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void incrementSecondCounter() {
    secondCounter++;
    notifyListeners();
  }
}
