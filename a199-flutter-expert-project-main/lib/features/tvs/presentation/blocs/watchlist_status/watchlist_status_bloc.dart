import 'package:bloc/bloc.dart';
import 'package:ditonton/features/tvs/domain/usecases/get_watch_list_tv_status.dart';
import 'package:equatable/equatable.dart';

part 'watchlist_status_event.dart';
part 'watchlist_status_state.dart';

class WatchlistStatusBloc
    extends Bloc<WatchlistStatusEvent, WatchlistStatusState> {
  final GetWatchListTvStatus getWatchListTvStatus;
  WatchlistStatusBloc({required this.getWatchListTvStatus})
      : super(WatchlistStatusInitial()) {
    on<WatchlistStatus>((event, emit) async {
      final result = await getWatchListTvStatus.execute(event.id);
      if (result) {
        emit(WatchlistStatusTrue());
      } else {
        emit(WatchlistStatusFalse());
      }
    });
  }
}
