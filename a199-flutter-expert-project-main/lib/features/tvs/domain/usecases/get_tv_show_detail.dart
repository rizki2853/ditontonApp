import 'package:dartz/dartz.dart';

import '../../../../common/failure.dart';
import '../entities/tv_show_detail.dart';
import '../repositories/tv_repository.dart';

class GetTvShowDetail {
  TVRepository repository;

  GetTvShowDetail({required this.repository});

  Future<Either<Failure, TVShowDetail>> execute(int id) async {
    return repository.getTvDetail(id);
  }
}
