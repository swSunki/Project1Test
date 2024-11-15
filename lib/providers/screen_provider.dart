import 'package:flutter/material.dart';

class ScreenProvider extends ChangeNotifier {
  int _currentPage = 2;
  int get currentPage => _currentPage;

  setCurrentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }
}
