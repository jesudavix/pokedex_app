import 'package:flutter/material.dart';

class InputBuscarPokemon extends StatelessWidget {
  const InputBuscarPokemon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          hintText: "Buscar Pokémon...",
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
        ),
        cursorColor: Colors.white,
      ),
    );
  }
}