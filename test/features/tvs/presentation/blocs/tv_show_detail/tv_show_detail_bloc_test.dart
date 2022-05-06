import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/features/tvs/domain/usecases/get_tv_show_detail.dart';
import 'package:ditonton/features/tvs/presentation/blocs/tv_show_detail/tv_show_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/dummy_objects.dart';
import 'tv_show_detail_bloc_test.mocks.dart';

@GenerateMocks([GetTvShowDetail])
void main() {
  late MockGetTvShowDetail usecase;
  late TvShowDetailBloc bloc;

  setUp(() {
    usecase = MockGetTvShowDetail();
    bloc = TvShowDetailBloc(getTvShowDetail: usecase);
  });

  test("initial state should be empty", () {
    expect(bloc.state, TvShowDetailStateEmpty());
  });

  blocTest<TvShowDetailBloc, TvShowDetailState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(usecase.execute(tId)).thenAnswer((_) async => Right(tTvDetail));
      return bloc;
    },
    act: (bloc) => bloc.add(TvShowDetail(tId)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      TvShowDetailStateLoading(),
      TvShowDetailStateLoaded(tTvDetail),
    ],
    verify: (bloc) {
      verify(usecase.execute(tId));
    },
  );

  blocTest<TvShowDetailBloc, TvShowDetailState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(usecase.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return bloc;
    },
    act: (bloc) => bloc.add(TvShowDetail(tId)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      TvShowDetailStateLoading(),
      TvShowDetailStateError('Server Failure'),
    ],
    verify: (bloc) {
      verify(usecase.execute(tId));
    },
  );
}
