import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_popular_movies.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final GetPopularMovies usecase;
  PopularMovieBloc({required this.usecase}) : super(PopularMovieInitial()) {
    on<PopularMovieEvent>((event, emit) async {
      emit(PopularMovieLoading());
      final result = await usecase.execute();

      result.fold(
        (failure) => emit(PopularMovieError(failure.message)),
        (result) => emit(PopularMovieLoaded(result)),
      );
    });
  }
}
