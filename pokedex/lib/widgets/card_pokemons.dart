import 'package:flutter/material.dart';
import 'package:pokedex/components/styles/colors.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  final PokemonData pokemon;

  const PokemonCard({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColorStytle.getColor(pokemon.types.first);

    return Card(
      color: color,
      child: ListTile(
        leading: Image.network(pokemon.imageUrl),
        title: Text(
          pokemon.name.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          pokemon.types.join(", "),
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}