// ignore_for_file: file_names

import 'package:app/domain/services/locator.dart';

import 'baseview_model.dart';

class HomeViewModel extends BaseViewModel {
  int _counter = 0;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  get counter => _counter;
}
