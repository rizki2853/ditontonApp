import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie_detail.dart';
import '../../../domain/usecases/remove_watchlist.dart';
import '../../../domain/usecases/save_watchlist.dart';

part 'watchlist_movie_event_event.dart';
part 'watchlist_movie_event_state.dart';

class WatchlistMovieEventBloc
    extends Bloc<WatchlistMovieEventEvent, WatchlistMovieEventState> {
  final RemoveWatchlist removeWatchlist;
  final SaveWatchlist saveWatchlist;
  WatchlistMovieEventBloc(
      {required this.saveWatchlist, required this.removeWatchlist})
      : super(WatchlistMovieEventInitial()) {
    on<RemoveWatchlistMovie>((event, emit) async {
      emit(WatchlistMovieEventLoading());
      final result = await removeWatchlist.execute(event.movie);
      result.fold(
        (failure) => emit(WatchlistMovieEventError(failure.message)),
        (result) => emit(WatchlistMovieEventLoaded(result)),
      );
    });
    on<AddWatchlistMovie>((event, emit) async {
      emit(WatchlistMovieEventLoading());
      final result = await saveWatchlist.execute(event.movie);
      result.fold(
        (failure) => emit(WatchlistMovieEventError(failure.message)),
        (result) => emit(WatchlistMovieEventLoaded(result)),
      );
    });
  }
}
