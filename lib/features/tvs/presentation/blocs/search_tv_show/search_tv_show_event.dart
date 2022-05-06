part of 'search_tv_show_bloc.dart';

abstract class SearchTvShowEvent extends Equatable {
  const SearchTvShowEvent();

  @override
  List<Object> get props => [];
}

class SearchTvShow extends SearchTvShowEvent {
  final String query;
  SearchTvShow(this.query);
}
