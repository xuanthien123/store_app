import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData? currentTheme = ThemeData(
    brightness: Brightness.light, // LightMode
    scaffoldBackgroundColor: Color.fromARGB(255, 243, 243, 243),
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
        scaffoldBackgroundColor: Color.fromARGB(255, 243, 243, 243),
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        backgroundColor: Colors.grey[100],
        shadowColor: Colors.black,
        fontFamily: 'Karla',
        visualDensity: VisualDensity.adaptivePlatformDensity,// more attributes
    );
    notifyListeners();
  }

  setDarkmode() {
    currentTheme = ThemeData(
        brightness: Brightness.dark, // DarkMode
        scaffoldBackgroundColor: Colors.black54,
        primarySwatch: Colors.blue,
        primaryColor: Colors.grey[800],
        backgroundColor: Colors.grey[900],
        shadowColor: Colors.white,
        fontFamily: 'Karla',
        visualDensity: VisualDensity.adaptivePlatformDensity,
    );
    notifyListeners();
  }
}