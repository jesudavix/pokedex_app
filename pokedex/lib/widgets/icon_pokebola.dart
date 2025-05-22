import 'package:flutter/material.dart';
import 'package:pokedex/components/styles/colors.dart';

class IconAppBarPokebola extends StatelessWidget {
  const IconAppBarPokebola({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Icon(
        Icons.catching_pokemon,
        color: AppColorStyle.typeColors["fire"],
        size: 38,
      ),
    );
  }
}