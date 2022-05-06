import 'package:dartz/dartz.dart';
import 'package:ditonton/features/tvs/domain/entities/tv.dart';
import 'package:ditonton/features/tvs/domain/usecases/get_now_playing_tv_show.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late GetNowPlayingTvShow usecase;
  late MockTVRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTVRepository();
    usecase = GetNowPlayingTvShow(mockTVRepository);
  });

  final tTv = <TV>[];

  group("GetNowPlayingTvShow test", () {
    test("should get list of now playing tv shows from the repository",
        () async {
      when(mockTVRepository.getNowPlayingTvShow())
          .thenAnswer((_) async => Right(tTv));

      final result = await usecase.excute();

      expect(result, Right(tTv));
    });
  });
}
