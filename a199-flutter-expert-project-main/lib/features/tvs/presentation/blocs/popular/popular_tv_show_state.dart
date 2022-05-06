part of 'popular_tv_show_bloc.dart';

abstract class PopularTvShowState extends Equatable {
  const PopularTvShowState();

  @override
  List<Object> get props => [];
}

class PopularTvShowStateEmpty extends PopularTvShowState {}

class PopularTvShowStateLoading extends PopularTvShowState {}

class PopularTvShowStateLoaded extends PopularTvShowState {
  final List<TV> result;

  PopularTvShowStateLoaded(this.result);
}

class PopularTvShowStateError extends PopularTvShowState {
  final String message;

  PopularTvShowStateError(this.message);
}
