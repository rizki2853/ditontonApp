part of 'now_playing_tv_show_bloc.dart';

abstract class NowPlayingTvShowState extends Equatable {
  const NowPlayingTvShowState();

  @override
  List<Object> get props => [];
}

class NowPlayingStateEmpty extends NowPlayingTvShowState {}

class NowPlayingStateLoading extends NowPlayingTvShowState {}

class NowPlayingStateLoaded extends NowPlayingTvShowState {
  final List<TV> result;

  NowPlayingStateLoaded(this.result);
}

class NowPlayingStateError extends NowPlayingTvShowState {
  final String message;

  NowPlayingStateError(this.message);
}
