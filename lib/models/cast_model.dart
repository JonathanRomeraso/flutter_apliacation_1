class CastModel {
  final bool adult;
  final int gender;
  final int id;
  final String? knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int? castId;
  final String character;
  final String creditId;
  final int order;

CastModel({
    required this.adult,
    required this.gender,
    required this.id,
    this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory CastModel.fromMap(Map<String, dynamic> cast) {
    return CastModel(
      adult: cast['adult'] ?? false,
      gender: cast['gender'] ?? 0,
      id: cast['id'] ?? 0,
      knownForDepartment: cast['known_for_department'],
      name: cast['name'] ?? 'Desconocido',
      originalName: cast['original_name'] ?? 'Desconocido',
      popularity: (cast['popularity'] ?? 0.0).toDouble(),
      profilePath: cast['profile_path'],
      castId: cast['cast_id'],
      character: cast['character'] ?? 'Desconocido',
      creditId: cast['credit_id'] ?? '',
      order: cast['order'] ?? 0,
    );
  }
}
