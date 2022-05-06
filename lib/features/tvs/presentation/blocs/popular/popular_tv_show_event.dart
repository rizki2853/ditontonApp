part of 'popular_tv_show_bloc.dart';

abstract class PopularTvShowEvent extends Equatable {
  const PopularTvShowEvent();

  @override
  List<Object> get props => [];
}

class PopularTvShow extends PopularTvShowEvent {}
