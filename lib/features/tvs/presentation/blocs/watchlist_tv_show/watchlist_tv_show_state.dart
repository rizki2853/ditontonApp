part of 'watchlist_tv_show_bloc.dart';

abstract class WatchlistTvShowState extends Equatable {
  const WatchlistTvShowState();

  @override
  List<Object> get props => [];
}

class WatchlistTvShowStateEmpty extends WatchlistTvShowState {}

class WatchlistTvShowStateLoading extends WatchlistTvShowState {}

class WatchlistTvShowStateLoaded extends WatchlistTvShowState {
  final List<TV> result;

  WatchlistTvShowStateLoaded(this.result);
}

class WatchlistTvShowStateError extends WatchlistTvShowState {
  final String message;

  WatchlistTvShowStateError(this.message);
}
