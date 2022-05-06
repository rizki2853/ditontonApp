import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/features/tvs/domain/usecases/get_watch_list_tv.dart';
import 'package:ditonton/features/tvs/presentation/blocs/watchlist_tv_show/watchlist_tv_show_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/dummy_objects.dart';
import 'watchlist_tv_show_bloc_test.mocks.dart';

@GenerateMocks([GetWatchListTv])
void main() {
  late MockGetWatchListTv usecase;
  late WatchlistTvShowBloc bloc;

  setUp(() {
    usecase = MockGetWatchListTv();
    bloc = WatchlistTvShowBloc(getWatchListTv: usecase);
  });

  test("initial state should be empty", () {
    expect(bloc.state, WatchlistTvShowStateEmpty());
  });

  blocTest<WatchlistTvShowBloc, WatchlistTvShowState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(usecase.execute()).thenAnswer((_) async => Right(tTvList));
      return bloc;
    },
    act: (bloc) => bloc.add(WatchlistTvShow()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistTvShowStateLoading(),
      WatchlistTvShowStateLoaded(tTvList),
    ],
    verify: (bloc) {
      verify(usecase.execute());
    },
  );

  blocTest<WatchlistTvShowBloc, WatchlistTvShowState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(usecase.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return bloc;
    },
    act: (bloc) => bloc.add(WatchlistTvShow()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistTvShowStateLoading(),
      WatchlistTvShowStateError('Server Failure'),
    ],
    verify: (bloc) {
      verify(usecase.execute());
    },
  );
}
