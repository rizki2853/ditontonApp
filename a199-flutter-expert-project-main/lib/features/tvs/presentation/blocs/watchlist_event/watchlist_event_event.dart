part of 'watchlist_event_bloc.dart';

abstract class WatchlistEventEvent extends Equatable {
  const WatchlistEventEvent();

  @override
  List<Object> get props => [];
}

class AddtoWatchList extends WatchlistEventEvent {
  final TVShowDetail tv;

  AddtoWatchList(this.tv);
}

class RemoveWatchList extends WatchlistEventEvent {
  final TVShowDetail tv;

  RemoveWatchList(this.tv);
}
