part of 'recomendation_movie_bloc.dart';

abstract class RecomendationMovieState extends Equatable {
  const RecomendationMovieState();

  @override
  List<Object> get props => [];
}

class RecomendationMovieInitial extends RecomendationMovieState {}

class RecomendationMovieLoading extends RecomendationMovieState {}

class RecomendationMovieLoaded extends RecomendationMovieState {
  final List<Movie> result;

  RecomendationMovieLoaded(this.result);
}

class RecomendationMovieError extends RecomendationMovieState {
  final String message;

  RecomendationMovieError(this.message);
}
