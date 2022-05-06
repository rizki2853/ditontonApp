import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';

import '../entities/tv.dart';
import '../repositories/tv_repository.dart';

class GetTopRateTvShow {
  final TVRepository repository;

  GetTopRateTvShow(this.repository);

  Future<Either<Failure, List<TV>>> excute() {
    return repository.getTopRateTvShow();
  }
}
