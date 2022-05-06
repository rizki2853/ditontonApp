import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/features/tvs/domain/usecases/remove_watchlist_tv.dart';
import 'package:ditonton/features/tvs/domain/usecases/save_watch_list_tv.dart';
import 'package:ditonton/features/tvs/presentation/blocs/watchlist_event/watchlist_event_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/dummy_objects.dart';
import 'watchlist_event_bloc_test.mocks.dart';

@GenerateMocks([SaveWatchListTv, RemoveWatchListTv])
void main() {
  late MockSaveWatchListTv saveWatchListTv;
  late MockRemoveWatchListTv removeWatchListTv;
  late WatchlistEventBloc bloc;

  setUp(() {
    saveWatchListTv = MockSaveWatchListTv();
    removeWatchListTv = MockRemoveWatchListTv();
    bloc = WatchlistEventBloc(
      saveWatchListTv: saveWatchListTv,
      removeWatchListTv: removeWatchListTv,
    );
  });

  test('initial state should be empty', () {
    expect(bloc.state, WatchlistEventStateEmpty());
  });

  group(
    'saveWatchListTv test',
    () {
      blocTest<WatchlistEventBloc, WatchlistEventState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(saveWatchListTv.execute(tTvDetail))
              .thenAnswer((_) async => Right('Added to Watchlist'));
          return bloc;
        },
        act: (bloc) => bloc.add(AddtoWatchList(tTvDetail)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          WatchlistEventStateLoading(),
          WatchlistEventStateLoaded('Added to Watchlist'),
        ],
        verify: (bloc) {
          verify(saveWatchListTv.execute(tTvDetail));
        },
      );

      blocTest<WatchlistEventBloc, WatchlistEventState>(
        'Should emit [Loading, Error] when get search is unsuccessful',
        build: () {
          when(saveWatchListTv.execute(tTvDetail))
              .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
          return bloc;
        },
        act: (bloc) => bloc.add(AddtoWatchList(tTvDetail)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          WatchlistEventStateLoading(),
          WatchlistEventStateError('Server Failure'),
        ],
        verify: (bloc) {
          verify(saveWatchListTv.execute(tTvDetail));
        },
      );
    },
  );

  group(
    'removeWatchListTv test',
    () {
      blocTest<WatchlistEventBloc, WatchlistEventState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(removeWatchListTv.execute(tTvDetail))
              .thenAnswer((_) async => Right('Removed from Watchlist'));
          return bloc;
        },
        act: (bloc) => bloc.add(RemoveWatchList(tTvDetail)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          WatchlistEventStateLoading(),
          WatchlistEventStateLoaded('Removed from Watchlist'),
        ],
        verify: (bloc) {
          verify(removeWatchListTv.execute(tTvDetail));
        },
      );

      blocTest<WatchlistEventBloc, WatchlistEventState>(
        'Should emit [Loading, Error] when get search is unsuccessful',
        build: () {
          when(removeWatchListTv.execute(tTvDetail))
              .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
          return bloc;
        },
        act: (bloc) => bloc.add(RemoveWatchList(tTvDetail)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          WatchlistEventStateLoading(),
          WatchlistEventStateError('Server Failure'),
        ],
        verify: (bloc) {
          verify(removeWatchListTv.execute(tTvDetail));
        },
      );
    },
  );
}
