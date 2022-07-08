import 'package:flutter/widgets.dart';

class BudgetService extends ChangeNotifier {
  double _budget = 2000;

  double get budget => _budget;

  set budget(double value) {
    budget = value;
    notifyListeners();
  }
}
