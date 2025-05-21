import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/blocs/bloc_ui_pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/components/styles/colors.dart';
import 'package:pokedex/repositories/api.dart';

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              PokemonBloc(PokemonRepository())..add(ObtenerListaPokemones()),
      child: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonCargando) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PokemonCargado) {
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 tarjetas por fila
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemCount: state.pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = state.pokemons[index];
                final color = AppColorStytle.getColor(pokemon.types.first);

                return Card(
                  color: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          pokemon.imageUrl,
                          height: 80,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => const Icon(Icons.error),
                        ),
                        Text(
                          pokemon.name[0].toUpperCase() +
                              pokemon.name.substring(1),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Wrap(
                          spacing: 6,
                          children:
                              pokemon.types
                                  .map(
                                    (type) => Chip(
                                      label: Text(
                                        type,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      backgroundColor: Colors.black26,
                                    ),
                                  )
                                  .toList(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is PokemonError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
