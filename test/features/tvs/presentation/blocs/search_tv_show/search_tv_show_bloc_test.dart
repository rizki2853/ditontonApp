import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/features/tvs/domain/usecases/search_tv.dart';
import 'package:ditonton/features/tvs/presentation/blocs/search_tv_show/search_tv_show_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/dummy_objects.dart';
import 'search_tv_show_bloc_test.mocks.dart';

@GenerateMocks([SearchTv])
void main() {
  late MockSearchTv usecase;
  late SearchTvShowBloc bloc;

  setUp(() {
    usecase = MockSearchTv();
    bloc = SearchTvShowBloc(searchTv: usecase);
  });

  test("initial state should be empty", () {
    expect(bloc.state, SearchTvShowStateEmpty());
  });

  blocTest<SearchTvShowBloc, SearchTvShowState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(usecase.execute(tQuery)).thenAnswer((_) async => Right(tTvList));
      return bloc;
    },
    act: (bloc) => bloc.add(SearchTvShow(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchTvShowStateLoading(),
      SearchTvShowStateLoaded(tTvList),
    ],
    verify: (bloc) {
      verify(usecase.execute(tQuery));
    },
  );

  blocTest<SearchTvShowBloc, SearchTvShowState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(usecase.execute(tQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return bloc;
    },
    act: (bloc) => bloc.add(SearchTvShow(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchTvShowStateLoading(),
      SearchTvShowStateError('Server Failure'),
    ],
    verify: (bloc) {
      verify(usecase.execute(tQuery));
    },
  );
}
