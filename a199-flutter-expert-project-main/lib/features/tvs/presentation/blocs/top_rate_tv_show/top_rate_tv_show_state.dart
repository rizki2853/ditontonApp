part of 'top_rate_tv_show_bloc.dart';

abstract class TopRateTvShowState extends Equatable {
  const TopRateTvShowState();

  @override
  List<Object> get props => [];
}

class TopRateTvShowStateEmpty extends TopRateTvShowState {}

class TopRateTvShowStateLoading extends TopRateTvShowState {}

class TopRateTvShowStateLoaded extends TopRateTvShowState {
  final List<TV> result;

  TopRateTvShowStateLoaded(this.result);
}

class TopRateTvShowStateError extends TopRateTvShowState {
  final String message;

  TopRateTvShowStateError(this.message);
}
