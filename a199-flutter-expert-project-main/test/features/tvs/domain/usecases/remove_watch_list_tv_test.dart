import 'package:dartz/dartz.dart';
import 'package:ditonton/features/tvs/domain/usecases/remove_watchlist_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockTVRepository repository;
  late RemoveWatchListTv usecase;

  setUp(() {
    repository = MockTVRepository();
    usecase = RemoveWatchListTv(repository: repository);
  });

  group(
    'execute method test',
    () {
      test(
        'should remove watchlist movie from repository and return message',
        () async {
          // arrange
          when(repository.removeWatchlist(tTvDetail))
              .thenAnswer((_) async => Right("Removed from watchlist"));
          // act
          final result = await usecase.execute(tTvDetail);
          // asset
          expect(result, Right("Removed from watchlist"));
        },
      );
    },
  );
}
