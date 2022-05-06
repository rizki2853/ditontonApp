import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/features/movies/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/features/movies/presentation/blocs/recomendation_movie/recomendation_movie_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/dummy_objects.dart';
import 'recomendation_movie_bloc_test.mocks.dart';

@GenerateMocks([GetMovieRecommendations])
void main() {
  late MockGetMovieRecommendations usecase;
  late RecomendationMovieBloc bloc;

  setUp(() {
    usecase = MockGetMovieRecommendations();
    bloc = RecomendationMovieBloc(usecase: usecase);
  });

  test('initial state should be empty', () {
    expect(bloc.state, RecomendationMovieInitial());
  });

  blocTest<RecomendationMovieBloc, RecomendationMovieState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(usecase.execute(tId)).thenAnswer((_) async => Right(testMovieList));
      return bloc;
    },
    act: (bloc) => bloc.add(GetRecomendationMovieEvent(tId)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      RecomendationMovieLoading(),
      RecomendationMovieLoaded(testMovieList),
    ],
    verify: (bloc) {
      verify(usecase.execute(tId));
    },
  );

  blocTest<RecomendationMovieBloc, RecomendationMovieState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(usecase.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return bloc;
    },
    act: (bloc) => bloc.add(GetRecomendationMovieEvent(tId)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      RecomendationMovieLoading(),
      RecomendationMovieError('Server Failure'),
    ],
    verify: (bloc) {
      verify(usecase.execute(tId));
    },
  );
}
