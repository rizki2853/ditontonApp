import 'package:dartz/dartz.dart';
import '../../../../../common/failure.dart';
import '../entities/tv.dart';
import '../repositories/tv_repository.dart';

class GetTvRecommendations {
  final TVRepository repository;

  GetTvRecommendations(this.repository);

  Future<Either<Failure, List<TV>>> execute(id) {
    return repository.getTvRecommendations(id);
  }
}
