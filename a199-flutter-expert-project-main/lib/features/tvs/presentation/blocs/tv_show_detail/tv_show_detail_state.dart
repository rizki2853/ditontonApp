part of 'tv_show_detail_bloc.dart';

abstract class TvShowDetailState extends Equatable {
  const TvShowDetailState();

  @override
  List<Object> get props => [];
}

class TvShowDetailStateEmpty extends TvShowDetailState {}

class TvShowDetailStateLoading extends TvShowDetailState {}

class TvShowDetailStateLoaded extends TvShowDetailState {
  final TVShowDetail result;

  TvShowDetailStateLoaded(this.result);
}

class TvShowDetailStateError extends TvShowDetailState {
  final String message;

  TvShowDetailStateError(this.message);
}
