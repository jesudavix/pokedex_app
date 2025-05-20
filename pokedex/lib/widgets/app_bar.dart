import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/blocs/bloc/search_bloc.dart';
import 'package:pokedex/components/styles/styles_text.dart';
import 'package:pokedex/widgets/icon_pokebola.dart';

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
              Flexible(
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Buscar Pokémon...",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.white,
                ),
              )
            else
              Text("Pokedex", style: AppTextStyle.appBarTitle()),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {
                context.read<SearchBloc>().add(MostrarBarraBuscador());
              },
              icon: const Icon(Icons.search, color: Colors.white, size: 30),
            ),
          ],
        ),
      ),
      body: Row(),
    );
  }
}
