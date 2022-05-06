import '../../domain/entities/tv.dart';

class TVShowModel extends TV {
  final String? posterPath;
  final num? popularity;
  final int? id;
  final String? backdropPath;
  final num? voteAverage;
  final String? overview;
  final String? firstAirDate;
  final List<dynamic> genreIds;
  final String? name;
  final List<dynamic> originalCountry;
  final String? originalLanguage;
  final String? originalName;
  final int voteCount;
  TVShowModel(
      {required this.posterPath,
      required this.popularity,
      required this.id,
      required this.backdropPath,
      required this.voteAverage,
      required this.overview,
      required this.firstAirDate,
      required this.genreIds,
      required this.name,
      required this.originalCountry,
      required this.originalLanguage,
      required this.originalName,
      required this.voteCount})
      : super(
            posterPath: posterPath,
            popularity: popularity,
            id: id,
            backdropPath: backdropPath,
            voteAverage: voteAverage,
            overview: overview,
            firstAirDate: firstAirDate,
            genreIds: genreIds,
            name: name,
            originalCountry: originalCountry,
            originalLanguage: originalLanguage,
            originalName: originalName,
            voteCount: voteCount);

  factory TVShowModel.fromJson(Map<String, dynamic> json) {
    return TVShowModel(
        posterPath: json['poster_path'],
        popularity: json['popularity'],
        id: json['id'],
        backdropPath: json['backdrop_path'],
        voteAverage: json['vote_average'],
        overview: json['overview'],
        firstAirDate: json['first_air_date'],
        genreIds: json['genre_ids'],
        name: json['name'],
        originalCountry: json['origin_country'],
        originalLanguage: json['original_language'],
        originalName: json['original_name'],
        voteCount: json['vote_count']);
  }

  Map<String, dynamic> toJson() {
    return {
      "poster_path": posterPath,
      "popularity": popularity,
      "id": id,
      "backdrop_path": backdropPath,
      "vote_average": voteAverage,
      "overview": overview,
      "first_air_date": firstAirDate,
      "origin_country": originalCountry,
      "genre_ids": genreIds,
      "original_language": originalLanguage,
      "vote_count": voteCount,
      "name": name,
      "original_name": originalName
    };
  }

  TV toEntitie() {
    return TV(
        posterPath: posterPath,
        popularity: popularity,
        id: id,
        backdropPath: backdropPath,
        voteAverage: voteAverage,
        overview: overview,
        firstAirDate: firstAirDate,
        genreIds: genreIds,
        name: name,
        originalCountry: originalCountry,
        originalLanguage: originalLanguage,
        originalName: originalName,
        voteCount: voteCount);
  }
}
