part of 'search_tv_show_bloc.dart';

abstract class SearchTvShowState extends Equatable {
  const SearchTvShowState();

  @override
  List<Object> get props => [];
}

class SearchTvShowStateEmpty extends SearchTvShowState {}

class SearchTvShowStateLoading extends SearchTvShowState {}

class SearchTvShowStateLoaded extends SearchTvShowState {
  final List<TV> result;

  SearchTvShowStateLoaded(this.result);
}

class SearchTvShowStateError extends SearchTvShowState {
  final String message;

  SearchTvShowStateError(this.message);
}
