import 'package:bloc/bloc.dart';
import 'package:ditonton/features/tvs/domain/entities/tv.dart';
import 'package:ditonton/features/tvs/domain/usecases/get_watch_list_tv.dart';
import 'package:equatable/equatable.dart';

part 'watchlist_tv_show_event.dart';
part 'watchlist_tv_show_state.dart';

class WatchlistTvShowBloc
    extends Bloc<WatchlistTvShowEvent, WatchlistTvShowState> {
  final GetWatchListTv getWatchListTv;
  WatchlistTvShowBloc({required this.getWatchListTv})
      : super(WatchlistTvShowStateEmpty()) {
    on<WatchlistTvShowEvent>((event, emit) async {
      emit(WatchlistTvShowStateLoading());
      final result = await getWatchListTv.execute();
      result.fold(
        (failure) => emit(WatchlistTvShowStateError(failure.message)),
        (result) => emit(WatchlistTvShowStateLoaded(result)),
      );
    });
  }
}
