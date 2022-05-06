import 'package:dartz/dartz.dart';

import '../../../../common/failure.dart';
import '../entities/tv_show_detail.dart';
import '../repositories/tv_repository.dart';

class SaveWatchListTv {
  TVRepository repository;

  SaveWatchListTv({required this.repository});

  Future<Either<Failure, String>> execute(TVShowDetail tv) async {
    return repository.saveWatchlist(tv);
  }
}
