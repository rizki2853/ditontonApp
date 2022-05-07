import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_movie_recommendations.dart';

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
