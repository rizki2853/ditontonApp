import 'package:equatable/equatable.dart';

class TV extends Equatable {
  String? posterPath;
  num? popularity;
  int? id;
  String? backdropPath;
  num? voteAverage;
  String? overview;
  String? firstAirDate;
  List<dynamic>? originalCountry;
  List<dynamic>? genreIds;
  String? originalLanguage;
  int? voteCount;
  String? name;
  String? originalName;

  TV({
    required this.posterPath,
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
    required this.voteCount,
  });

  TV.watchlist({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.name,
  });

  @override
  List<Object?> get props => [
        posterPath,
        popularity,
        id,
        backdropPath,
        voteAverage,
        overview,
        firstAirDate,
        genreIds,
        name,
        originalCountry,
        originalLanguage,
        originalName,
        voteCount,
      ];
}
