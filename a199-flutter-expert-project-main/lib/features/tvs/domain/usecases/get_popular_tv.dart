import 'package:dartz/dartz.dart';

import '../../../../../common/failure.dart';
import '../entities/tv.dart';
import '../repositories/tv_repository.dart';

class GetPopularTv {
  final TVRepository repository;

  GetPopularTv(this.repository);

  Future<Either<Failure, List<TV>>> execute() {
    return repository.getPopularTvShow();
  }
}
