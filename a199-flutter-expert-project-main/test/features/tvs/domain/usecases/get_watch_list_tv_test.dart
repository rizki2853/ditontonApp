import 'package:dartz/dartz.dart';
import 'package:ditonton/features/tvs/domain/usecases/get_watch_list_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockTVRepository repository;
  late GetWatchListTv usecase;

  setUp(() {
    repository = MockTVRepository();
    usecase = GetWatchListTv(repository: repository);
  });

  group(
    'GetWatchListTv execute method test',
    () {
      test(
        'Should get list of tv from repository',
        () async {
          // arrange
          when(repository.getWatchlistTv())
              .thenAnswer((_) async => Right(tTvList));
          // act
          final result = await usecase.execute();
          // asset
          expect(result, Right(tTvList));
        },
      );
    },
  );
}
