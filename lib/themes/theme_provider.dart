import 'package:flutter/material.dart';
import 'dark_mode.dart';
import 'light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  ThemeData get currentTheme => isDarkMode ? darkMode : lightMode;

  void toggleTheme(bool value) {
    isDarkMode = value;
    notifyListeners(); // notify app to rebuild
  }
}
