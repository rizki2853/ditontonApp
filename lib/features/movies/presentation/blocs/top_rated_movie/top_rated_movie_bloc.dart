import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_top_rated_movies.dart';

part 'top_rated_movie_event.dart';
part 'top_rated_movie_state.dart';

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  final GetTopRatedMovies usecase;
  TopRatedMovieBloc({required this.usecase}) : super(TopRatedMovieInitial()) {
    on<TopRatedMovieEvent>((event, emit) async {
      emit(TopRatedMovieLoading());
      final result = await usecase.execute();

      result.fold(
        (failure) => emit(TopRatedMovieError(failure.message)),
        (result) => emit(TopRatedMovieLoaded(result)),
      );
    });
  }
}
