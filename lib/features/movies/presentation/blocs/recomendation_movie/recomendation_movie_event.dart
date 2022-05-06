part of 'recomendation_movie_bloc.dart';

abstract class RecomendationMovieEvent extends Equatable {
  const RecomendationMovieEvent();

  @override
  List<Object> get props => [];
}

class GetRecomendationMovieEvent extends RecomendationMovieEvent {
  final int id;

  GetRecomendationMovieEvent(this.id);
}
