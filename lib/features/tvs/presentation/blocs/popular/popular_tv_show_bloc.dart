import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/tv.dart';
import '../../../domain/usecases/get_popular_tv.dart';

part 'popular_tv_show_event.dart';
part 'popular_tv_show_state.dart';

class PopularTvShowBloc extends Bloc<PopularTvShowEvent, PopularTvShowState> {
  final GetPopularTv getPopularTv;
  PopularTvShowBloc({required this.getPopularTv})
      : super(PopularTvShowStateEmpty()) {
    on<PopularTvShowEvent>((event, emit) async {
      emit(PopularTvShowStateLoading());
      final result = await getPopularTv.execute();

      result.fold(
        (failure) => emit(PopularTvShowStateError(failure.message)),
        (result) => emit(PopularTvShowStateLoaded(result)),
      );
    });
  }
}
