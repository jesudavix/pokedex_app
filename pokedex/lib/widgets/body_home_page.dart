import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/blocs/bloc_ui_pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/components/styles/colors.dart';
import 'package:pokedex/components/styles/styles_text.dart';


class BodyHomePage extends StatelessWidget {
  const BodyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        if (state is PokemonCargando) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.red),
          );
        } else if (state is PokemonCargado) {
          return GridView.builder(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 6, right: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 14,
            ),
            itemCount: state.pokemons.length,
            itemBuilder: (context, index) {
              final colorCard = AppColorStyle.getColor(
                state.pokemons[index].types.first,
              );
              return Card(
                color: colorCard,
                elevation: 4,
                child: Column(
                  children: [
                    Image.network(
                      state.pokemons[index].imageUrl,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      state.pokemons[index].name.toUpperCase(),
                      style: AppTextStyle.pokemonName(),
                    ),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: [
                        ...state.pokemons[index].types.map((type) {
                          final typeColor = AppColorStyle.getColorParaTipo(
                            type,
                          );
                          return Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(15),
                              color: typeColor,
                            ),
                            child: Text(
                              type.toUpperCase(),
                              style: AppTextStyle.pokemonType(),
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
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
    );
  }
}
