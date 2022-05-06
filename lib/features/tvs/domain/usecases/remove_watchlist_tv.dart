import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';

import '../entities/tv_show_detail.dart';
import '../repositories/tv_repository.dart';

class RemoveWatchListTv {
  TVRepository repository;

  RemoveWatchListTv({required this.repository});

  Future<Either<Failure, String>> execute(TVShowDetail tv) async {
    return repository.removeWatchlist(tv);
  }
}
