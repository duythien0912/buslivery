import 'package:flutter/material.dart';

class BusAppAppModel with ChangeNotifier {
  bool _isShow = false;

  bool get isShow => _isShow;

  void setShowBusItem(bool value) {
    _isShow = value;
    notifyListeners();
  }
}
