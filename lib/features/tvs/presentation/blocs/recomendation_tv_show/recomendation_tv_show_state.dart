part of 'recomendation_tv_show_bloc.dart';

abstract class RecomendationTvShowState extends Equatable {
  const RecomendationTvShowState();

  @override
  List<Object> get props => [];
}

class RecomendationTvShowStateEmpty extends RecomendationTvShowState {}

class RecomendationTvShowStateLoading extends RecomendationTvShowState {}

class RecomendationTvShowStateLoaded extends RecomendationTvShowState {
  final List<TV> recomendation;
  RecomendationTvShowStateLoaded(this.recomendation);
}

class RecomendationTvShowStateError extends RecomendationTvShowState {
  final String message;
  RecomendationTvShowStateError(this.message);
}
