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
import 'package:ditonton/features/tvs/presentation/blocs/search_tv_show/search_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/top_rate_tv_show/top_rate_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/tv_show_detail/tv_show_detail_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/watchlist_event/watchlist_event_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/watchlist_status/watchlist_status_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/watchlist_tv_show/watchlist_tv_show_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'common/constants.dart';
import 'common/http_ssl_pining.dart';
import 'common/utils.dart';
import 'features/movies/presentation/pages/about_page.dart';
import 'features/movies/presentation/pages/home_movie_page.dart';
import 'features/movies/presentation/pages/movie_detail_page.dart';
import 'features/movies/presentation/pages/popular_movies_page.dart';
import 'features/movies/presentation/pages/search_page.dart';
import 'features/movies/presentation/pages/top_rated_movies_page.dart';
import 'features/movies/presentation/pages/watchlist_movies_page.dart';
import 'features/tvs/presentation/blocs/popular/popular_tv_show_bloc.dart';
import 'features/tvs/presentation/pages/home_tv_page.dart';
import 'features/tvs/presentation/pages/now_playing_tv_show_page.dart';
import 'features/tvs/presentation/pages/popular_tv_show_page.dart';
import 'features/tvs/presentation/pages/top_rated_tv_show_page.dart';
import 'features/tvs/presentation/pages/tv_search_page.dart';
import 'features/tvs/presentation/pages/tv_show_detail_page.dart';
import 'features/tvs/presentation/pages/watchlist_tv_page.dart';
import 'injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HttpSSLPinning.init();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<NowPlayingTvShowBloc>(
          create: (_) => di.locator<NowPlayingTvShowBloc>(),
        ),
        BlocProvider<PopularTvShowBloc>(
          create: (_) => di.locator<PopularTvShowBloc>(),
        ),
        BlocProvider<TopRateTvShowBloc>(
          create: (_) => di.locator<TopRateTvShowBloc>(),
        ),
        BlocProvider<SearchTvShowBloc>(
          create: (_) => di.locator<SearchTvShowBloc>(),
        ),
        BlocProvider<WatchlistTvShowBloc>(
          create: (_) => di.locator<WatchlistTvShowBloc>(),
        ),
        BlocProvider<TvShowDetailBloc>(
          create: (_) => di.locator<TvShowDetailBloc>(),
        ),
        BlocProvider<RecomendationTvShowBloc>(
          create: (_) => di.locator<RecomendationTvShowBloc>(),
        ),
        BlocProvider<WatchlistEventBloc>(
          create: (_) => di.locator<WatchlistEventBloc>(),
        ),
        BlocProvider<WatchlistStatusBloc>(
          create: (_) => di.locator<WatchlistStatusBloc>(),
        ),
        BlocProvider<MovieDetailBloc>(
          create: (_) => di.locator<MovieDetailBloc>(),
        ),
        BlocProvider<NowPlayingMovieBloc>(
          create: (_) => di.locator<NowPlayingMovieBloc>(),
        ),
        BlocProvider<PopularMovieBloc>(
          create: (_) => di.locator<PopularMovieBloc>(),
        ),
        BlocProvider<RecomendationMovieBloc>(
          create: (_) => di.locator<RecomendationMovieBloc>(),
        ),
        BlocProvider<SearchMovieBloc>(
          create: (_) => di.locator<SearchMovieBloc>(),
        ),
        BlocProvider<TopRatedMovieBloc>(
          create: (_) => di.locator<TopRatedMovieBloc>(),
        ),
        BlocProvider<WatchlistMovieBloc>(
          create: (_) => di.locator<WatchlistMovieBloc>(),
        ),
        BlocProvider<WatchlistMovieEventBloc>(
          create: (_) => di.locator<WatchlistMovieEventBloc>(),
        ),
        BlocProvider<WatchlistMovieStatusBloc>(
          create: (_) => di.locator<WatchlistMovieStatusBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case TVSearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TVSearchPage());
            case HomeTvPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => HomeTvPage());
            case WatchlistTvPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => WatchlistTvPage());
            case TopRatedTvShowPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedTvShowPage());
            case NowPlayingTvShowPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => NowPlayingTvShowPage());
            case PopularTvShowPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularTvShowPage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case TvShowDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvShowDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case WatchlistMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
