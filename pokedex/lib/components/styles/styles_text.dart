import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle appBarTitle() {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.2,
    );
  }

  static TextStyle pokemonName() {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle pokemonType() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
}
