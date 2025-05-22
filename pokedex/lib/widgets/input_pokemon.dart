import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/blocs/bloc_ui_pokemon/bloc/pokemon_bloc.dart';

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
        onChanged: (value) {
          final bloc = context.read<PokemonBloc>();
          if (value.isEmpty){
            bloc.add(ObtenerListaPokemones());
          } else{
            bloc.add(BuscarPokemonPorNombre(value));
          }
        },
      ),
    );
  }
}