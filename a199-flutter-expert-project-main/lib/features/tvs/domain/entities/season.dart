import 'package:equatable/equatable.dart';

class Season extends Equatable {
  final String airDate;
  final String name;
  final String overview;
  final String posterPath;
  final int seasonNumber;
  final int id;
  final int episodeCount;

  Season({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
  });

  @override
  List<Object?> get props => [
        airDate,
        episodeCount,
        id,
        name,
        overview,
        seasonNumber,
        posterPath,
      ];
}
