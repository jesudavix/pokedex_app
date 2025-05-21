import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon_model.dart';


class PokemonRepository {
  final String baseUrl = "https://pokeapi.co/api/v2/pokemon?limit=20";

  Future<List<PokemonData>> obtenerPokemonList() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List;

      // Llamada adicional para cada URL
      final List<PokemonData> pokemonList = [];

      for (var pokemon in results) {
        final detallesPokemon = await http.get(Uri.parse(pokemon['url']));

        if (detallesPokemon.statusCode == 200) {
          final detalleslData = json.decode(detallesPokemon.body);
          final pokeData = PokemonData.fromJson(detalleslData);
          pokemonList.add(pokeData);
        } else {
          throw Exception('Error al cargar los Pokémon');
        }
      }
      return pokemonList;
    } else {
      throw Exception('Error al cargar los Pokémon');
    }
  }
}