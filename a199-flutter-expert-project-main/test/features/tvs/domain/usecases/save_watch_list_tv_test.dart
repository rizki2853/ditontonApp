import 'package:dartz/dartz.dart';
import 'package:ditonton/features/tvs/domain/usecases/save_watch_list_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockTVRepository repository;
  late SaveWatchListTv usecase;

  setUp(() {
    repository = MockTVRepository();
    usecase = SaveWatchListTv(repository: repository);
  });

  group(
    'execute method test',
    () {
      test(
        'should save movie to the repository and return succesfully message',
        () async {
          // arrange
          when(repository.saveWatchlist(tTvDetail))
              .thenAnswer((_) async => Right("Added to Watchlist"));
          // act
          final result = await usecase.execute(tTvDetail);
          // asset
          expect(result, Right("Added to Watchlist"));
        },
      );
    },
  );
}
