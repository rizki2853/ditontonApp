import 'package:bloc/bloc.dart';
import 'package:ditonton/features/tvs/domain/entities/tv.dart';
import 'package:ditonton/features/tvs/domain/usecases/get_top_rated_tv_show.dart';
import 'package:equatable/equatable.dart';

part 'top_rate_tv_show_event.dart';
part 'top_rate_tv_show_state.dart';

class TopRateTvShowBloc extends Bloc<TopRateTvShowEvent, TopRateTvShowState> {
  final GetTopRateTvShow getTopRateTvShow;
  TopRateTvShowBloc({required this.getTopRateTvShow})
      : super(TopRateTvShowStateEmpty()) {
    on<TopRateTvShowEvent>((event, emit) async {
      emit(TopRateTvShowStateLoading());
      final result = await getTopRateTvShow.excute();
      result.fold(
        (failure) => emit(TopRateTvShowStateError(failure.message)),
        (result) => emit(TopRateTvShowStateLoaded(result)),
      );
    });
  }
}
