import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/features/tvs/domain/usecases/get_now_playing_tv_show.dart';
import 'package:ditonton/features/tvs/presentation/blocs/now_playing_tv_show/now_playing_tv_show_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/dummy_objects.dart';
import 'now_playing_tv_show_bloc_test.mocks.dart';

@GenerateMocks([GetNowPlayingTvShow])
void main() {
  late MockGetNowPlayingTvShow usecase;
  late NowPlayingTvShowBloc bloc;

  setUp(() {
    usecase = MockGetNowPlayingTvShow();
    bloc = NowPlayingTvShowBloc(getNowPlayingTvShow: usecase);
  });

  test('initial state should be empty', () {
    expect(bloc.state, NowPlayingStateEmpty());
  });

  blocTest<NowPlayingTvShowBloc, NowPlayingTvShowState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(usecase.excute()).thenAnswer((_) async => Right(tTvList));
      return bloc;
    },
    act: (bloc) => bloc.add(NowPlayingTvShow()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      NowPlayingStateLoading(),
      NowPlayingStateLoaded(tTvList),
    ],
    verify: (bloc) {
      verify(usecase.excute());
    },
  );

  blocTest<NowPlayingTvShowBloc, NowPlayingTvShowState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(usecase.excute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return bloc;
    },
    act: (bloc) => bloc.add(NowPlayingTvShow()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      NowPlayingStateLoading(),
      NowPlayingStateError('Server Failure'),
    ],
    verify: (bloc) {
      verify(usecase.excute());
    },
  );
}
