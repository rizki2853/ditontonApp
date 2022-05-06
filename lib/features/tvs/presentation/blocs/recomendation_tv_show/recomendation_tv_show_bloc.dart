import 'package:bloc/bloc.dart';
import 'package:ditonton/features/tvs/domain/usecases/get_tv_recommendations.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/tv.dart';

part 'recomendation_tv_show_event.dart';
part 'recomendation_tv_show_state.dart';

class RecomendationTvShowBloc
    extends Bloc<RecomendationTvShowEvent, RecomendationTvShowState> {
  final GetTvRecommendations getTvRecommendations;
  RecomendationTvShowBloc({required this.getTvRecommendations})
      : super(RecomendationTvShowStateEmpty()) {
    on<RecomendationTvShow>((event, emit) async {
      emit(RecomendationTvShowStateLoading());
      final result = await getTvRecommendations.execute(event.id);

      result.fold(
        (failure) => emit(RecomendationTvShowStateError(failure.message)),
        (result) => emit(RecomendationTvShowStateLoaded(result)),
      );
    });
  }
}
