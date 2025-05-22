import 'package:flutter/material.dart';
import 'package:pokedex/blocs/bloc_search_icon_input/search_bloc.dart';
import 'package:pokedex/widgets/app_bar_home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePagePokemon extends StatelessWidget {
  const HomePagePokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return AppBarHome(state: state,);
        },
      ),
    );
  }
}