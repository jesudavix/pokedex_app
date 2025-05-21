import 'package:flutter/material.dart';
import 'package:pokedex/blocs/bloc/search_bloc.dart';
import 'package:pokedex/components/styles/styles_text.dart';
import 'package:pokedex/widgets/icon_pokebola.dart';
import 'package:pokedex/widgets/icon_search_pokemon.dart';
import 'package:pokedex/widgets/input_pokemon.dart';

class AppBarHome extends StatelessWidget {
  final SearchState state;

  const AppBarHome({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconAppBarPokebola(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (state is BarraBuscadorVisible)
              InputBuscarPokemon()
            else
              Text("Pokedex", style: AppTextStyle.appBarTitle()),
            const SizedBox(width: 8),
            ButtonBuscarPokemon(state: state),
          ],
        ),
      ),
      body: Row(),
    );
  }
}



