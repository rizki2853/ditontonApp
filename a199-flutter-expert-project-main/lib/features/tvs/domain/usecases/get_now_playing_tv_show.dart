import 'package:dartz/dartz.dart';

import '../../../../../common/failure.dart';
import '../entities/tv.dart';
import '../repositories/tv_repository.dart';

class GetNowPlayingTvShow {
  final TVRepository repository;

  GetNowPlayingTvShow(this.repository);

  Future<Either<Failure, List<TV>>> excute() {
    return repository.getNowPlayingTvShow();
  }
}
