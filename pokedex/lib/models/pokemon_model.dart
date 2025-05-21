class PokemonData {
  final String name;
  final String imageUrl;
  final List<String> types;

  PokemonData({
    required this.name,
    required this.imageUrl,
    required this.types,
  });

  factory PokemonData.fromJson(Map<String, dynamic> json) {
    return PokemonData(
      name: json['name'],
      imageUrl: json['sprites']['front_default'],
      types: (json['types'] as List)
          .map((e) => e['type']['name'] as String)
          .toList(),
    );
  }
}
