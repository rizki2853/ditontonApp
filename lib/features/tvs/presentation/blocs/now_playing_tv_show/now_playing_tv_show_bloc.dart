import 'package:bloc/bloc.dart';
import 'package:ditonton/features/tvs/domain/usecases/get_now_playing_tv_show.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/tv.dart';

part 'now_playing_tv_show_event.dart';
part 'now_playing_tv_show_state.dart';

class NowPlayingTvShowBloc
    extends Bloc<NowPlayingTvShowEvent, NowPlayingTvShowState> {
  final GetNowPlayingTvShow getNowPlayingTvShow;
  NowPlayingTvShowBloc({required this.getNowPlayingTvShow})
      : super(NowPlayingStateEmpty()) {
    on<NowPlayingTvShowEvent>((event, emit) async {
      emit(NowPlayingStateLoading());
      final result = await getNowPlayingTvShow.excute();
      result.fold(
        (failure) => emit(NowPlayingStateError(failure.message)),
        (result) => emit(NowPlayingStateLoaded(result)),
      );
    });
  }
}
