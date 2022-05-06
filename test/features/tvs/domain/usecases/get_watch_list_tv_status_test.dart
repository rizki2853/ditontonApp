import 'package:ditonton/features/tvs/domain/usecases/get_watch_list_tv_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockTVRepository repository;
  late GetWatchListTvStatus usecase;

  setUp(() {
    repository = MockTVRepository();
    usecase = GetWatchListTvStatus(repository: repository);
  });

  group(
    'GetWatchListTvStatus test',
    () {
      test(
        'Should get watchlist status from repository',
        () async {
          // arrange
          when(repository.isAddedToWatchlist(tId))
              .thenAnswer((_) async => true);
          // act
          final result = await usecase.execute(tId);
          // asset
          expect(result, true);
        },
      );
    },
  );
}
