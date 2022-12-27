import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  int idTheme = 0;
  ThemeData? currentTheme = ThemeData(
    brightness: Brightness.light, // LightMode
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.blue,
    primaryColor: Colors.white,
    backgroundColor: Colors.grey[100],
    shadowColor: Colors.black,
    fontFamily: 'Karla',
    visualDensity: VisualDensity.adaptivePlatformDensity,// more attributes
  );

  setLightMode() {
    currentTheme = ThemeData(
        brightness: Brightness.light, // LightMode
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        backgroundColor: Colors.grey[100],
        shadowColor: Colors.black,
        fontFamily: 'Karla',
        visualDensity: VisualDensity.adaptivePlatformDensity,// more attributes
    );
    idTheme = 0;
    notifyListeners();
  }

  setDarkmode() {
    currentTheme = ThemeData(
        brightness: Brightness.dark, // DarkMode
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.blue,
        primaryColor: Colors.grey[800],
        backgroundColor: Colors.grey[900],
        shadowColor: Colors.white,
        fontFamily: 'Karla',
        visualDensity: VisualDensity.adaptivePlatformDensity,
    );
    idTheme = 1;
    notifyListeners();
  }
}