import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/repositories/api.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {

  final PokemonRepository pokemonRepository;
  List<PokemonData> _todosLosPokemones = [];

  PokemonBloc(this.pokemonRepository) : super(PokemonInicial()) {
    on<ObtenerListaPokemones>((event, emit) async {
      emit(PokemonCargando());
      try {
        final pokemons = await pokemonRepository.obtenerPokemonList();
        _todosLosPokemones = pokemons;
        emit(PokemonCargado(pokemons: pokemons));
      } catch (e) {
        emit(PokemonError('Error al cargar los Pokémon'));
      }
    });

    on<BuscarPokemonPorNombre>((event,emit){
      final query = event.nombre.toLowerCase();
      final filtrados = _todosLosPokemones
          .where((pokemon) => pokemon.name.toLowerCase().contains(query))
          .toList();

      emit(PokemonCargado(pokemons: filtrados));
    });
  }
}
