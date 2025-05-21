part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class ObtenerListaPokemones extends PokemonEvent{}
class ObtenerPokemonSearch extends PokemonEvent{}