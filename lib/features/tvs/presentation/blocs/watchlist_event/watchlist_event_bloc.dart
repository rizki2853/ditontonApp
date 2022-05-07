import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/tv_show_detail.dart';
import '../../../domain/usecases/remove_watchlist_tv.dart';
import '../../../domain/usecases/save_watch_list_tv.dart';

part 'watchlist_event_event.dart';
part 'watchlist_event_state.dart';

class WatchlistEventBloc
    extends Bloc<WatchlistEventEvent, WatchlistEventState> {
  final SaveWatchListTv saveWatchListTv;
  final RemoveWatchListTv removeWatchListTv;
  WatchlistEventBloc(
      {required this.saveWatchListTv, required this.removeWatchListTv})
      : super(WatchlistEventStateEmpty()) {
    on<AddtoWatchList>((event, emit) async {
      emit(WatchlistEventStateLoading());
      final result = await saveWatchListTv.execute(event.tv);

      result.fold(
        (failure) => emit(WatchlistEventStateError(failure.message)),
        (result) => emit(WatchlistEventStateLoaded(result)),
      );
    });
    on<RemoveWatchList>((event, emit) async {
      emit(WatchlistEventStateLoading());
      final result = await removeWatchListTv.execute(event.tv);

      result.fold(
        (failure) => emit(WatchlistEventStateError(failure.message)),
        (result) => emit(WatchlistEventStateLoaded(result)),
      );
    });
  }
}
