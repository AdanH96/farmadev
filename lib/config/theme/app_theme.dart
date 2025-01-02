import 'package:flutter/material.dart';

class AppTheme {
  int defaultColor = 6;
  int? colorSeleccionado;
  final List colorTheme = [
    Colors.amber,
    Colors.blue,
    Colors.blueGrey,
    Colors.brown,
    Colors.cyan,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.green,
    Colors.grey,
    Colors.indigo,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.lime,
  ];

  AppTheme({int? colorSeleccionado}) {
    assert(colorSeleccionado == null ||
        colorSeleccionado >= 0 && colorSeleccionado < colorTheme.length - 1);
    this.colorSeleccionado = colorSeleccionado ?? defaultColor;
  }

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorTheme[colorSeleccionado ?? defaultColor],
    );
  }
}
