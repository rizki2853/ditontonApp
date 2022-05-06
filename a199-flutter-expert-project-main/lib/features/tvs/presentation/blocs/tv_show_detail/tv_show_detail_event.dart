part of 'tv_show_detail_bloc.dart';

abstract class TvShowDetailEvent extends Equatable {
  const TvShowDetailEvent();

  @override
  List<Object> get props => [];
}

class TvShowDetail extends TvShowDetailEvent {
  final int id;
  TvShowDetail(this.id);
}
