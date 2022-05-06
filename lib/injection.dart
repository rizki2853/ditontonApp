import 'package:ditonton/features/movies/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:ditonton/features/movies/presentation/blocs/now_playing_movie/now_playing_movie_bloc.dart';
import 'package:ditonton/features/movies/presentation/blocs/popular_movie/popular_movie_bloc.dart';
import 'package:ditonton/features/movies/presentation/blocs/recomendation_movie/recomendation_movie_bloc.dart';
import 'package:ditonton/features/movies/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:ditonton/features/movies/presentation/blocs/top_rated_movie/top_rated_movie_bloc.dart';
import 'package:ditonton/features/movies/presentation/blocs/watchlist_movie/watchlist_movie_bloc.dart';
import 'package:ditonton/features/movies/presentation/blocs/watchlist_movie_event/watchlist_movie_event_bloc.dart';
import 'package:ditonton/features/movies/presentation/blocs/watchlist_movie_status/watchlist_movie_status_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/now_playing_tv_show/now_playing_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/recomendation_tv_show/recomendation_tv_show_bloc.dart';

import 'package:ditonton/features/tvs/presentation/blocs/top_rate_tv_show/top_rate_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/tv_show_detail/tv_show_detail_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/watchlist_event/watchlist_event_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/watchlist_status/watchlist_status_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/watchlist_tv_show/watchlist_tv_show_bloc.dart';
import 'package:get_it/get_it.dart';
import 'common/db/database_helper.dart';
import 'common/http_ssl_pining.dart';
import 'features/movies/data/datasources/movie_local_data_source.dart';
import 'features/movies/data/datasources/movie_remote_data_source.dart';
import 'features/movies/data/repositories/movie_repository_impl.dart';
import 'features/movies/domain/repositories/movie_repository.dart';
import 'features/movies/domain/usecases/get_movie_detail.dart';
import 'features/movies/domain/usecases/get_movie_recommendations.dart';
import 'features/movies/domain/usecases/get_now_playing_movies.dart';
import 'features/movies/domain/usecases/get_popular_movies.dart';
import 'features/movies/domain/usecases/get_top_rated_movies.dart';
import 'features/movies/domain/usecases/get_watchlist_movies.dart';
import 'features/movies/domain/usecases/get_watchlist_status.dart';
import 'features/movies/domain/usecases/remove_watchlist.dart';
import 'features/movies/domain/usecases/save_watchlist.dart';
import 'features/movies/domain/usecases/search_movies.dart';
import 'features/tvs/data/datasources/tv_show_local_data_source.dart';
import 'features/tvs/data/datasources/tv_show_remote_data_source.dart';
import 'features/tvs/data/repositories/tv_repository_impl.dart';
import 'features/tvs/domain/repositories/tv_repository.dart';
import 'features/tvs/domain/usecases/get_now_playing_tv_show.dart';
import 'features/tvs/domain/usecases/get_popular_tv.dart';
import 'features/tvs/domain/usecases/get_top_rated_tv_show.dart';
import 'features/tvs/domain/usecases/get_tv_recommendations.dart';
import 'features/tvs/domain/usecases/get_tv_show_detail.dart';
import 'features/tvs/domain/usecases/get_watch_list_tv.dart';
import 'features/tvs/domain/usecases/get_watch_list_tv_status.dart';
import 'features/tvs/domain/usecases/remove_watchlist_tv.dart';
import 'features/tvs/domain/usecases/save_watch_list_tv.dart';
import 'features/tvs/domain/usecases/search_tv.dart';
import 'features/tvs/presentation/blocs/popular/popular_tv_show_bloc.dart';
import 'features/tvs/presentation/blocs/search_tv_show/search_tv_show_bloc.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => MovieDetailBloc(
      usecase: locator(),
    ),
  );
  locator.registerFactory(
    () => NowPlayingMovieBloc(
      usecase: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMovieBloc(
      usecase: locator(),
    ),
  );
  locator.registerFactory(
    () => RecomendationMovieBloc(
      usecase: locator(),
    ),
  );
  locator.registerFactory(
    () => SearchMovieBloc(
      usecase: locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMovieBloc(
      usecase: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieBloc(
      getWatchlistMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieEventBloc(
      removeWatchlist: locator(),
      saveWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieStatusBloc(
      usecase: locator(),
    ),
  );
  locator.registerFactory(
    () => RecomendationTvShowBloc(
      getTvRecommendations: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistStatusBloc(
      getWatchListTvStatus: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistEventBloc(
      removeWatchListTv: locator(),
      saveWatchListTv: locator(),
    ),
  );
  locator.registerFactory(
    () => NowPlayingTvShowBloc(
      getNowPlayingTvShow: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularTvShowBloc(
      getPopularTv: locator(),
    ),
  );
  locator.registerFactory(
    () => TopRateTvShowBloc(
      getTopRateTvShow: locator(),
    ),
  );
  locator.registerFactory(
    () => SearchTvShowBloc(
      searchTv: locator(),
    ),
  );
  locator.registerFactory(
    () => TvShowDetailBloc(
      getTvShowDetail: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistTvShowBloc(
      getWatchListTv: locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => SaveWatchListTv(repository: locator()));
  locator.registerLazySingleton(() => SearchTv(repository: locator()));
  locator.registerLazySingleton(() => GetWatchListTv(repository: locator()));
  locator
      .registerLazySingleton(() => GetWatchListTvStatus(repository: locator()));
  locator.registerLazySingleton(() => RemoveWatchListTv(repository: locator()));
  locator.registerLazySingleton(() => GetTvShowDetail(repository: locator()));
  locator.registerLazySingleton(() => GetTvRecommendations(locator()));
  locator.registerLazySingleton(() => GetNowPlayingTvShow(locator()));
  locator.registerLazySingleton(() => GetPopularTv(locator()));
  locator.registerLazySingleton(() => GetTopRateTvShow(locator()));
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TVRepository>(
    () => TVRepositoryImpl(
      localDataSource: locator(),
      remoteDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<TVShowRemoteDataSource>(
      () => TVShowRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvShowLocalDataSource>(
      () => TvShowLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => HttpSSLPinning.client);
}
