import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/features/tvs/domain/usecases/get_popular_tv.dart';
import 'package:ditonton/features/tvs/presentation/blocs/popular/popular_tv_show_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/dummy_objects.dart';
import 'popular_tv_show_bloc_test.mocks.dart';

@GenerateMocks([GetPopularTv])
void main() {
  late MockGetPopularTv usecase;
  late PopularTvShowBloc bloc;

  setUp(() {
    usecase = MockGetPopularTv();
    bloc = PopularTvShowBloc(getPopularTv: usecase);
  });

  test("initial state should be empty", () {
    expect(bloc.state, PopularTvShowStateEmpty());
  });

  blocTest<PopularTvShowBloc, PopularTvShowState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(usecase.execute()).thenAnswer((_) async => Right(tTvList));
      return bloc;
    },
    act: (bloc) => bloc.add(PopularTvShow()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      PopularTvShowStateLoading(),
      PopularTvShowStateLoaded(tTvList),
    ],
    verify: (bloc) {
      verify(usecase.execute());
    },
  );

  blocTest<PopularTvShowBloc, PopularTvShowState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(usecase.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return bloc;
    },
    act: (bloc) => bloc.add(PopularTvShow()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      PopularTvShowStateLoading(),
      PopularTvShowStateError('Server Failure'),
    ],
    verify: (bloc) {
      verify(usecase.execute());
    },
  );
}
