import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/features/tvs/domain/usecases/get_tv_recommendations.dart';
import 'package:ditonton/features/tvs/presentation/blocs/recomendation_tv_show/recomendation_tv_show_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/dummy_objects.dart';
import 'recomendation_tv_show_bloc_test.mocks.dart';

@GenerateMocks([GetTvRecommendations])
void main() {
  late MockGetTvRecommendations usecase;
  late RecomendationTvShowBloc bloc;

  setUp(() {
    usecase = MockGetTvRecommendations();
    bloc = RecomendationTvShowBloc(getTvRecommendations: usecase);
  });

  test("initial state should be empty", () {
    expect(bloc.state, RecomendationTvShowStateEmpty());
  });

  blocTest<RecomendationTvShowBloc, RecomendationTvShowState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(usecase.execute(tId)).thenAnswer((_) async => Right(tTvList));
      return bloc;
    },
    act: (bloc) => bloc.add(RecomendationTvShow(tId)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      RecomendationTvShowStateLoading(),
      RecomendationTvShowStateLoaded(tTvList),
    ],
    verify: (bloc) {
      verify(usecase.execute(tId));
    },
  );

  blocTest<RecomendationTvShowBloc, RecomendationTvShowState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(usecase.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return bloc;
    },
    act: (bloc) => bloc.add(RecomendationTvShow(tId)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      RecomendationTvShowStateLoading(),
      RecomendationTvShowStateError('Server Failure'),
    ],
    verify: (bloc) {
      verify(usecase.execute(tId));
    },
  );
}
