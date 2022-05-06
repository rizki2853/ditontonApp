import 'package:equatable/equatable.dart';

import '../../../movies/domain/entities/genre.dart';
import 'season.dart';

class TVShowDetail extends Equatable {
  TVShowDetail(
      {required this.episodeRunTime,
      required this.backdropPath,
      required this.genres,
      required this.id,
      required this.originalName,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.name,
      required this.voteAverage,
      required this.voteCount,
      required this.seasons});

  final List<dynamic> episodeRunTime;
  final String? backdropPath;
  final List<Genre> genres;
  final int id;
  final String originalName;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String name;
  final double voteAverage;
  final int voteCount;
  final List<Season> seasons;

  @override
  List<Object?> get props => [
        episodeRunTime,
        backdropPath,
        genres,
        id,
        originalName,
        overview,
        posterPath,
        releaseDate,
        name,
        voteAverage,
        voteCount,
        seasons
      ];
}
