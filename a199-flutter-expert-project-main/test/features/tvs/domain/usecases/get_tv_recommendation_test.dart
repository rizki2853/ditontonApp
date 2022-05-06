import 'package:dartz/dartz.dart';
import 'package:ditonton/features/tvs/domain/entities/tv.dart';
import 'package:ditonton/features/tvs/domain/usecases/get_tv_recommendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvRecommendations usecase;
  late MockTVRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTVRepository();
    usecase = GetTvRecommendations(mockTVRepository);
  });

  final tTVs = <TV>[];
  final tId = 1;

  group('GettvShowRekomendations Tests', () {
    group('execute', () {
      test(
          'should get list of Tv Show from the repository when execute function is called',
          () async {
        // arrange
        when(mockTVRepository.getTvRecommendations(tId))
            .thenAnswer((_) async => Right(tTVs));
        // act
        final result = await usecase.execute(tId);
        // assert
        expect(result, Right(tTVs));
      });
    });
  });
}
