import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie_detail.dart';
import '../../../domain/usecases/get_movie_detail.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail usecase;
  MovieDetailBloc({required this.usecase}) : super(MovieDetailInitial()) {
    on<GetMovieDetailEvent>((event, emit) async {
      emit(MovieDetailLoading());
      final result = await usecase.execute(event.id);

      result.fold(
        (failure) => emit(MovieDetailError(failure.message)),
        (result) => emit(MovieDetailLoaded(result)),
      );
    });
  }
}
