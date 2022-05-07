import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/entities/tv.dart';
import '../../../domain/usecases/search_tv.dart';

part 'search_tv_show_event.dart';
part 'search_tv_show_state.dart';

class SearchTvShowBloc extends Bloc<SearchTvShowEvent, SearchTvShowState> {
  final SearchTv searchTv;
  SearchTvShowBloc({required this.searchTv}) : super(SearchTvShowStateEmpty()) {
    on<SearchTvShow>((event, emit) async {
      emit(SearchTvShowStateLoading());
      final query = event.query;
      final result = await searchTv.execute(query);

      result.fold(
        (failure) => emit(SearchTvShowStateError(failure.message)),
        (result) => emit(SearchTvShowStateLoaded(result)),
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
