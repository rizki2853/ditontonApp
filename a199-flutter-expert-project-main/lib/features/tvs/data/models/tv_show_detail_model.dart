import 'package:equatable/equatable.dart';

import '../../../movies/data/models/genre_model.dart';
import '../../domain/entities/tv_show_detail.dart';
import 'seasons_model.dart';

class TvShowDetailModel extends Equatable {
  final List<dynamic> episodeRunTime;
  final String? backdropPath;
  final List<GenreModel> genres;
  final int id;
  final String originalName;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String name;
  final double voteAverage;
  final int voteCount;
  final List<SeasonsModel> seasons;

  TvShowDetailModel(
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

  factory TvShowDetailModel.fromJson(Map<String, dynamic> json) {
    return TvShowDetailModel(
      episodeRunTime: json['episode_run_time'],
      backdropPath: json['backdrop_path'],
      genres: List<GenreModel>.from(
          json['genres'].map((x) => GenreModel.fromJson(x))),
      id: json['id'],
      originalName: json['original_name'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['first_air_date'],
      name: json['name'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      seasons: List<SeasonsModel>.from(
          json['seasons'].map((x) => SeasonsModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'episode_run_time': episodeRunTime,
      'backdrop_path': backdropPath,
      'genres': List<dynamic>.from(genres.map((x) => x.toJson())),
      'id': id,
      'original_name': originalName,
      'overview': overview,
      'poster_path': posterPath,
      'first_air_date': releaseDate,
      'name': name,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'seasons': List<dynamic>.from(seasons.map((x) => x.toJson())),
    };
  }

  TVShowDetail toEntitie() {
    return TVShowDetail(
      episodeRunTime: episodeRunTime,
      backdropPath: backdropPath,
      genres: this.genres.map((genre) => genre.toEntity()).toList(),
      id: id,
      originalName: originalName,
      overview: overview,
      posterPath: posterPath,
      releaseDate: releaseDate,
      name: name,
      voteAverage: voteAverage,
      voteCount: voteCount,
      seasons: this.seasons.map((season) => season.toEntitie()).toList(),
    );
  }

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
