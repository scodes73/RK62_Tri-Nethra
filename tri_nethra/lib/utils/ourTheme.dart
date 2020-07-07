import 'package:flutter/material.dart';

class OurTheme {
  Color _grey = Color.fromARGB(255, 18, 18, 18);
  ThemeData buildTheme() {
    return ThemeData(canvasColor: _grey);
  }
}
