import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';

import '../entities/tv.dart';
import '../repositories/tv_repository.dart';

class GetWatchListTv {
  TVRepository repository;

  GetWatchListTv({required this.repository});

  Future<Either<Failure, List<TV>>> execute() async {
    return repository.getWatchlistTv();
  }
}
