part of 'recomendation_tv_show_bloc.dart';

abstract class RecomendationTvShowEvent extends Equatable {
  const RecomendationTvShowEvent();

  @override
  List<Object> get props => [];
}

class RecomendationTvShow extends RecomendationTvShowEvent {
  final int id;

  RecomendationTvShow(this.id);
}
