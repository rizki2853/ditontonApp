import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/tv_show_detail.dart';
import '../../../domain/usecases/get_tv_show_detail.dart';

part 'tv_show_detail_event.dart';
part 'tv_show_detail_state.dart';

class TvShowDetailBloc extends Bloc<TvShowDetailEvent, TvShowDetailState> {
  final GetTvShowDetail getTvShowDetail;
  TvShowDetailBloc({
    required this.getTvShowDetail,
  }) : super(TvShowDetailStateEmpty()) {
    on<TvShowDetail>((event, emit) async {
      emit(TvShowDetailStateLoading());
      final id = event.id;
      final result = await getTvShowDetail.execute(id);
      result.fold(
        (failure) => emit(TvShowDetailStateError(failure.message)),
        (result) => emit(TvShowDetailStateLoaded(result)),
      );
    });
  }
}
