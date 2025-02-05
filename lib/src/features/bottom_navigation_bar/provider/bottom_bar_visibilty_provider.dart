import 'package:flutter/material.dart';

class BottomBarVisibilityProvider with ChangeNotifier {
  bool _isBottomBarVisible = true;

  bool get isBottomBarVisible => _isBottomBarVisible;

  void toggleVisibility() {
    _isBottomBarVisible = !_isBottomBarVisible;
    notifyListeners(); // Notify listeners about the change
  }
}