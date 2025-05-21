import 'package:flutter/material.dart';

class AppColorStytle{

static const Map<String, Color> typeColors = {
    'fire': Color(0xFFCC0000),
    'electric': Color(0xFFFFCC00),
    'water': Color(0xFF3399FF),
    'grass': Color(0xFF77CC55),
    'psychic': Color(0xFFAA66CC),
    'normal': Colors.grey,
  };

  static Color getColor(String type) {
    return typeColors[type] ?? Colors.grey;
  }
}