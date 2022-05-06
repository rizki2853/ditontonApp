import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/features/tvs/domain/usecases/get_top_rated_tv_show.dart';
import 'package:ditonton/features/tvs/presentation/blocs/top_rate_tv_show/top_rate_tv_show_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/dummy_objects.dart';
import 'top_rate_tv_show_bloc_test.mocks.dart';

@GenerateMocks([GetTopRateTvShow])
void main() {
  late MockGetTopRateTvShow usecase;
  late TopRateTvShowBloc bloc;

  setUp(() {
    usecase = MockGetTopRateTvShow();
    bloc = TopRateTvShowBloc(getTopRateTvShow: usecase);
  });

  test("initial state should be empty", () {
    expect(bloc.state, TopRateTvShowStateEmpty());
  });

  blocTest<TopRateTvShowBloc, TopRateTvShowState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(usecase.excute()).thenAnswer((_) async => Right(tTvList));
      return bloc;
    },
    act: (bloc) => bloc.add(TopRateTvShow()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      TopRateTvShowStateLoading(),
      TopRateTvShowStateLoaded(tTvList),
    ],
    verify: (bloc) {
      verify(usecase.excute());
    },
  );

  blocTest<TopRateTvShowBloc, TopRateTvShowState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(usecase.excute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return bloc;
    },
    act: (bloc) => bloc.add(TopRateTvShow()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      TopRateTvShowStateLoading(),
      TopRateTvShowStateError('Server Failure'),
    ],
    verify: (bloc) {
      verify(usecase.excute());
    },
  );
}
