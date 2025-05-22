import 'package:flutter/material.dart';

class AppColorStyle {
  static const Map<String, Color> typeColors = {
    'fire': Color(0xFFCC0000),
    'electric': Color(0xFFFFCC00),
    'water': Color(0xFF3399FF),
    'grass': Color(0xFF77CC55),
    'psychic': Color(0xFFAA66CC),
    'bug': Color(0xFF9ACD32),
    'normal': Colors.grey,
    'poison': Color(0xFF8A2BE2),
    'fighting': Color(0xFFB87333),
    'flying': Color(0xFF87CEEB),
    'ground': Color(0xFFD2B48C),
    'rock': Color(0xFFB8A038),
    'ghost': Color(0xFF705898),
    'ice': Color(0xFF98D8D8),
    'dragon': Color(0xFF7038F8),
    'dark': Color(0xFF4F4F4F),
    'steel': Color(0xFFB8B8D0),
    'fairy': Color(0xFFEE99AC),
  };

  static Color getColor(String type) {
    return typeColors[type] ?? Colors.grey;
  }

  static Color getColorParaTipo(String type) {
  final baseColor = typeColors[type] ?? Colors.grey;
  return baseColor.withAlpha(200); // más oscurecido
}

}
