import 'package:flutter/material.dart';
import 'package:pokedex/blocs/bloc_search_icon_input/search_bloc.dart';
import 'package:pokedex/blocs/bloc_ui_pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/repositories/api.dart';
import 'package:pokedex/widgets/app_bar_home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePagePokemon extends StatelessWidget {
  const HomePagePokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SearchBloc()),
        BlocProvider(create: (context) => PokemonBloc(PokemonRepository())..add(ObtenerListaPokemones())),
      ],
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return AppBarHome(state: state);
        },
      ),
    );
  }
}
