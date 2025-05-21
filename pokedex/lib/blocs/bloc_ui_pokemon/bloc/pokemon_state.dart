part of 'pokemon_bloc.dart';

sealed class PokemonState extends Equatable {
  const PokemonState();
  
  @override
  List<Object> get props => [];
}

final class PokemonInicial extends PokemonState {}

final class PokemonCargando extends PokemonState{}

final class PokemonCargado extends PokemonState{

  final List<PokemonData> pokemons;

  const PokemonCargado({required this.pokemons});

   @override
  List<Object> get props => [pokemons];
}

final class PokemonError extends PokemonState{
  final String message;

  const PokemonError(this.message);

  @override
  List<Object> get props => [message];
}
