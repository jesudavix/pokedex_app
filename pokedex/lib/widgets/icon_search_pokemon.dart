import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/blocs/bloc_search_icon_input/search_bloc.dart';

class ButtonBuscarPokemon extends StatelessWidget {
  final SearchState state;

  const ButtonBuscarPokemon({
    super.key,
    required this.state,
  });



  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (state is BarraBuscadorVisible) {
          context.read<SearchBloc>().add(OcultarBarraBuscador());
        } else {
          context.read<SearchBloc>().add(MostrarBarraBuscador());
        }
      },
      icon: Icon(
        state is BarraBuscadorVisible ? Icons.close : Icons.search,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}