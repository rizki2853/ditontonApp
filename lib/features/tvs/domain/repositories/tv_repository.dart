import 'package:dartz/dartz.dart';

import '../../../../common/failure.dart';
import '../entities/tv.dart';
import '../entities/tv_show_detail.dart';

abstract class TVRepository {
  Future<Either<Failure, List<TV>>> getPopularTvShow();
  Future<Either<Failure, List<TV>>> getNowPlayingTvShow();
  Future<Either<Failure, List<TV>>> getTopRateTvShow();
  Future<Either<Failure, TVShowDetail>> getTvDetail(int id);
  Future<Either<Failure, List<TV>>> getTvRecommendations(int id);
  Future<Either<Failure, List<TV>>> searchTvs(String query);
  Future<Either<Failure, String>> saveWatchlist(TVShowDetail tv);
  Future<Either<Failure, String>> removeWatchlist(TVShowDetail tv);
  Future<bool> isAddedToWatchlist(int id);
  Future<Either<Failure, List<TV>>> getWatchlistTv();
}
