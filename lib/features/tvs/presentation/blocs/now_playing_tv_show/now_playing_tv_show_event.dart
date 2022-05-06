part of 'now_playing_tv_show_bloc.dart';

abstract class NowPlayingTvShowEvent extends Equatable {
  const NowPlayingTvShowEvent();

  @override
  List<Object> get props => [];
}

class NowPlayingTvShow extends NowPlayingTvShowEvent {}
