import 'package:dartz/dartz.dart';
import 'package:ditonton/features/tvs/domain/usecases/get_tv_show_detail.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvShowDetail usecase;
  late MockTVRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTVRepository();
    usecase = GetTvShowDetail(repository: mockTVRepository);
  });

  group(
    'GetNowPlayingTvShow test',
    () {
      test(
        'Should get list of Tv Show from the repository when execute function is called',
        () async {
          // arrange
          when(mockTVRepository.getTvDetail(tId))
              .thenAnswer((_) async => Right(tTvDetail));
          // act
          final result = await usecase.execute(tId);
          // asset
          expect(result, Right(tTvDetail));
        },
      );
    },
  );
}
