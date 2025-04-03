class TrailerModel {
  String iso6391;
  String iso31661;
  String name;
  String key;
  String site;
  int size;
  String type;
  bool official;
  DateTime publishedAt;
  String id;

  TrailerModel({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory TrailerModel.fromMap(Map<String, dynamic> trailer) {
    return TrailerModel(
      iso6391: trailer['iso_639_1'] ?? 'Desconocido',
      iso31661: trailer['iso_3166_1'] ?? 'Desconocido',
      name: trailer['name'] ?? 'Desconocido',
      key: trailer['key'] ?? 'Desconocido',
      site: trailer['site'] ?? 'Desconocido',
      size: trailer['size'] ?? 0,
      type: trailer['type'] ?? 'Desconocido',
      official: trailer['official'] ?? false,
      publishedAt: DateTime.parse(trailer['published_at']),
      id: trailer['id'] ?? 'Desconocido',
    );
  }
}
