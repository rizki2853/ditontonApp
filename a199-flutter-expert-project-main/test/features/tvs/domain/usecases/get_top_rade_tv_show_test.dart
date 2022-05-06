import 'package:dartz/dartz.dart';
import 'package:ditonton/features/tvs/domain/entities/tv.dart';
import 'package:ditonton/features/tvs/domain/usecases/get_top_rated_tv_show.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTopRateTvShow usecase;
  late MockTVRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTVRepository();
    usecase = GetTopRateTvShow(mockTVRepository);
  });

  final tTv = <TV>[];

  group('GetTopRateTVShow test', () {
    test(
        "should get list of Tv Show from the repository when execute function is called",
        () async {
      when(mockTVRepository.getTopRateTvShow())
          .thenAnswer((realInvocation) async => Right(tTv));

      final result = await usecase.excute();
      expect(result, Right(tTv));
    });
  });
}
