import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton/features/movies/presentation/blocs/now_playing_movie/now_playing_movie_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/dummy_objects.dart';
import 'now_playing_movie_bloc_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies])
void main() {
  late MockGetNowPlayingMovies usecase;
  late NowPlayingMovieBloc bloc;

  setUp(() {
    usecase = MockGetNowPlayingMovies();
    bloc = NowPlayingMovieBloc(usecase: usecase);
  });

  test('initial state should be empty', () {
    expect(bloc.state, NowPlayingMovieInitial());
  });

  blocTest<NowPlayingMovieBloc, NowPlayingMovieState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(usecase.execute()).thenAnswer((_) async => Right(testMovieList));
      return bloc;
    },
    act: (bloc) => bloc.add(GetNowPlayingMovieEvent()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      NowPlayingMovieLoading(),
      NowPlayingMovieLoaded(testMovieList),
    ],
    verify: (bloc) {
      verify(usecase.execute());
    },
  );

  blocTest<NowPlayingMovieBloc, NowPlayingMovieState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(usecase.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return bloc;
    },
    act: (bloc) => bloc.add(GetNowPlayingMovieEvent()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      NowPlayingMovieLoading(),
      NowPlayingMovieError('Server Failure'),
    ],
    verify: (bloc) {
      verify(usecase.execute());
    },
  );
}
