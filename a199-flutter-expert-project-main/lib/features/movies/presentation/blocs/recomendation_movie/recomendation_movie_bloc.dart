import 'package:bloc/bloc.dart';
import 'package:ditonton/features/movies/domain/entities/movie.dart';
import 'package:ditonton/features/movies/domain/usecases/get_movie_recommendations.dart';
import 'package:equatable/equatable.dart';

part 'recomendation_movie_event.dart';
part 'recomendation_movie_state.dart';

class RecomendationMovieBloc
    extends Bloc<RecomendationMovieEvent, RecomendationMovieState> {
  final GetMovieRecommendations usecase;
  RecomendationMovieBloc({required this.usecase})
      : super(RecomendationMovieInitial()) {
    on<GetRecomendationMovieEvent>((event, emit) async {
      emit(RecomendationMovieLoading());
      final result = await usecase.execute(event.id);

      result.fold(
        (failure) => emit(RecomendationMovieError(failure.message)),
        (result) => emit(RecomendationMovieLoaded(result)),
      );
    });
  }
}
