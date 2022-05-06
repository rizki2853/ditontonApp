import 'package:dartz/dartz.dart';
import 'package:ditonton/features/tvs/domain/entities/tv.dart';
import 'package:ditonton/features/tvs/domain/usecases/search_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockTVRepository repository;
  late SearchTv usecase;

  setUp(() {
    repository = MockTVRepository();
    usecase = SearchTv(repository: repository);
  });

  group(
    'execute method test',
    () {
      final tTv = <TV>[];
      final tquery = "kimi no nawa";

      test(
        'Should return list of tv from repository in accordance with the query',
        () async {
          // arrange
          when(repository.searchTvs(tquery))
              .thenAnswer((_) async => Right(tTv));
          // act
          final result = await usecase.execute(tquery);
          // asset
          expect(result, Right(tTv));
        },
      );
    },
  );
}
