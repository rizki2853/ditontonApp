import 'package:ditonton/common/utils.dart';
import 'package:ditonton/features/movies/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:ditonton/features/movies/presentation/blocs/now_playing_movie/now_playing_movie_bloc.dart';
import 'package:ditonton/features/movies/presentation/blocs/popular_movie/popular_movie_bloc.dart';
import 'package:ditonton/features/movies/presentation/blocs/recomendation_movie/recomendation_movie_bloc.dart';
import 'package:ditonton/features/movies/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:ditonton/features/movies/presentation/blocs/top_rated_movie/top_rated_movie_bloc.dart';
import 'package:ditonton/features/movies/presentation/blocs/watchlist_movie/watchlist_movie_bloc.dart';
import 'package:ditonton/features/movies/presentation/blocs/watchlist_movie_event/watchlist_movie_event_bloc.dart';
import 'package:ditonton/features/movies/presentation/blocs/watchlist_movie_status/watchlist_movie_status_bloc.dart';
import 'package:ditonton/features/movies/presentation/pages/about_page.dart';
import 'package:ditonton/features/movies/presentation/pages/home_movie_page.dart';
import 'package:ditonton/features/movies/presentation/pages/movie_detail_page.dart';
import 'package:ditonton/features/movies/presentation/pages/popular_movies_page.dart';
import 'package:ditonton/features/movies/presentation/pages/search_page.dart';
import 'package:ditonton/features/movies/presentation/pages/top_rated_movies_page.dart';
import 'package:ditonton/features/movies/presentation/pages/watchlist_movies_page.dart';
import 'package:ditonton/features/tvs/presentation/blocs/now_playing_tv_show/now_playing_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/popular/popular_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/recomendation_tv_show/recomendation_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/search_tv_show/search_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/top_rate_tv_show/top_rate_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/tv_show_detail/tv_show_detail_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/watchlist_event/watchlist_event_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/watchlist_status/watchlist_status_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/watchlist_tv_show/watchlist_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/pages/home_tv_page.dart';
import 'package:ditonton/features/tvs/presentation/pages/now_playing_tv_show_page.dart';
import 'package:ditonton/features/tvs/presentation/pages/popular_tv_show_page.dart';
import 'package:ditonton/features/tvs/presentation/pages/top_rated_tv_show_page.dart';
import 'package:ditonton/features/tvs/presentation/pages/tv_search_page.dart';
import 'package:ditonton/features/tvs/presentation/pages/tv_show_detail_page.dart';
import 'package:ditonton/features/tvs/presentation/pages/watchlist_tv_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../dummy_data/dummy_objects.dart';

class MockPopularTvShowBloc extends Mock implements PopularTvShowBloc {}

class FakePopularEvent extends Fake implements PopularTvShowEvent {}

class FakePopularState extends Fake implements PopularTvShowState {}

class MockTopRatedTvShowBloc extends Mock implements TopRateTvShowBloc {}

class FakeTopRatedEvent extends Fake implements TopRateTvShowEvent {}

class FakeTopRatedState extends Fake implements TopRateTvShowState {}

class MockNowPlayingTvShowBloc extends Mock implements NowPlayingTvShowBloc {}

class NowPlayingtvStateFake extends Fake implements NowPlayingTvShowState {}

class NowPlayingtvEventFake extends Fake implements NowPlayingTvShowEvent {}

class MockTvDetailBloc extends Mock implements TvShowDetailBloc {}

class TvDetailStateFake extends Fake implements TvShowDetailState {}

class TvDetailEventFake extends Fake implements TvShowDetailEvent {}

class MockWatchlistEventBloc extends Mock implements WatchlistEventBloc {}

class WatchlistEventFake extends Fake implements WatchlistEventEvent {}

class WatchlistStateFake extends Fake implements WatchlistEventState {}

class MockWatchlistStatusBloc extends Mock implements WatchlistStatusBloc {}

class WatchlistStatusEventFake extends Fake implements WatchlistStatusEvent {}

class WatchlistStatusStateFake extends Fake implements WatchlistStatusState {}

class MockTvSearchBloc extends Mock implements SearchTvShowBloc {}

class TvSearchEventFake extends Fake implements SearchTvShowEvent {}

class TvSearchStateFake extends Fake implements SearchTvShowState {}

class MockWatchlistTVBloc extends Mock implements WatchlistTvShowBloc {}

class WatchlistTVEventFake extends Fake implements WatchlistTvShowEvent {}

class WatchlistTVStateFake extends Fake implements WatchlistTvShowState {}

class MockNowPlayingMovieBloc extends Mock implements NowPlayingMovieBloc {}

class NowPlayingMovieStateFake extends Fake implements NowPlayingMovieState {}

class NowPlayingMovieEventFake extends Fake implements NowPlayingMovieEvent {}

class MockPopulerMovieBloc extends Mock implements PopularMovieBloc {}

class PopularMovieStateFake extends Fake implements PopularMovieState {}

class PopularMovieEventFake extends Fake implements PopularMovieEvent {}

class MockTopRatedMovieBloc extends Mock implements TopRatedMovieBloc {}

class TopRatedMovieStateFake extends Fake implements TopRatedMovieState {}

class TopRatedMovieEventFake extends Fake implements TopRatedMovieEvent {}

class MockMovieDetailBloc extends Mock implements MovieDetailBloc {}

class MovieDetailStateFake extends Fake implements MovieDetailState {}

class MovieDetailEventFake extends Fake implements MovieDetailEvent {}

class MockWatchlistMovieEventBloc extends Mock
    implements WatchlistMovieEventBloc {}

class WatchlistMovieEventStateFake extends Fake
    implements WatchlistMovieEventState {}

class WatchlistMovieEventEventFake extends Fake
    implements WatchlistMovieEventEvent {}

class MockWatchlistMovieStatusBloc extends Mock
    implements WatchlistMovieStatusBloc {}

class WatchlistMovieStatusEventFake extends Fake
    implements WatchlistMovieStatusEvent {}

class WatchlistMovieStatusStateFake extends Fake
    implements WatchlistMovieStatusState {}

class MockRecomendationMovieBloc extends Mock
    implements RecomendationMovieBloc {}

class RecomendationMovieStateFake extends Fake
    implements RecomendationMovieState {}

class RecomendationMovieEventFake extends Fake
    implements RecomendationMovieEvent {}

class MockRecomendationTvShowBloc extends Mock
    implements RecomendationTvShowBloc {}

class RecomendationTvShowStateFake extends Fake
    implements RecomendationTvShowState {}

class RecomendationTvShowEventFake extends Fake
    implements RecomendationTvShowEvent {}

class MockMovieSearchBloc extends Mock implements SearchMovieBloc {}

class MovieSearchEventFake extends Fake implements SearchMovieEvent {}

class MovieSearchStateFake extends Fake implements SearchMovieState {}

class MockWatchlistMovieBloc extends Mock implements WatchlistMovieBloc {}

class WatchlistMovieEventFake extends Fake implements WatchlistMovieEvent {}

class WatchlistMovieStateFake extends Fake implements WatchlistMovieState {}

void main() {
  //Movie
  late MockNowPlayingMovieBloc mockNowPlayingMovieBloc;
  late MockPopulerMovieBloc mockPopulerMovieBloc;
  late MockTopRatedMovieBloc mockTopRatedMovieBloc;
  late MockMovieDetailBloc mockMovieDetailBloc;
  late MockWatchlistMovieEventBloc mockWatchlistMovieEventBloc;
  late MockWatchlistMovieStatusBloc mockWatchlistMovieStatusBloc;
  late MockRecomendationMovieBloc mockRecomendationMovieBloc;
  late MockMovieSearchBloc mockMovieSearchBloc;
  late MockWatchlistMovieBloc mockWatchlistMovieBloc;

  //Tv
  late MockPopularTvShowBloc mockPopularTvShowBloc;
  late MockNowPlayingTvShowBloc mockNowPlayingTvShowBloc;
  late MockTopRatedTvShowBloc mockTopRateTvShowBloc;
  late MockWatchlistEventBloc mockWatchlistEventBloc;
  late MockTvDetailBloc mockTvDetailBloc;
  late MockWatchlistStatusBloc mockWatchlistStatusBloc;
  late MockRecomendationTvShowBloc mockRecomendationTvShowBloc;
  late MockTvSearchBloc mockTvSearchBloc;
  late MockWatchlistTVBloc mockWatchlistTVBloc;

  setUpAll(() {
    //Movie
    registerFallbackValue(NowPlayingMovieStateFake());
    registerFallbackValue(NowPlayingMovieEventFake());
    registerFallbackValue(PopularMovieStateFake());
    registerFallbackValue(PopularMovieEventFake());
    registerFallbackValue(TopRatedMovieStateFake());
    registerFallbackValue(TopRatedMovieEventFake());
    registerFallbackValue(MovieDetailStateFake());
    registerFallbackValue(MovieDetailEventFake());
    registerFallbackValue(WatchlistStatusEventFake());
    registerFallbackValue(WatchlistStatusStateFake());
    registerFallbackValue(WatchlistMovieEventEventFake());
    registerFallbackValue(WatchlistMovieEventStateFake());
    registerFallbackValue(RecomendationMovieStateFake());
    registerFallbackValue(RecomendationMovieEventFake());
    registerFallbackValue(WatchlistMovieEventFake());
    registerFallbackValue(WatchlistMovieStateFake());

    //Tv
    registerFallbackValue(FakePopularEvent());
    registerFallbackValue(FakePopularState());
    registerFallbackValue(FakeTopRatedEvent());
    registerFallbackValue(FakeTopRatedState());
    registerFallbackValue(NowPlayingtvStateFake());
    registerFallbackValue(NowPlayingtvEventFake());
    registerFallbackValue(TvDetailStateFake());
    registerFallbackValue(TvDetailEventFake());
    registerFallbackValue(WatchlistEventFake());
    registerFallbackValue(WatchlistStateFake());
    registerFallbackValue(WatchlistStatusEventFake());
    registerFallbackValue(WatchlistStatusStateFake());
    registerFallbackValue(RecomendationTvShowEventFake());
    registerFallbackValue(RecomendationTvShowStateFake());
    registerFallbackValue(TvSearchEventFake());
    registerFallbackValue(TvSearchStateFake());
    registerFallbackValue(WatchlistTVEventFake());
    registerFallbackValue(WatchlistTVStateFake());
  });

  setUp(() {
    //Movie
    mockNowPlayingMovieBloc = MockNowPlayingMovieBloc();
    mockPopulerMovieBloc = MockPopulerMovieBloc();
    mockTopRatedMovieBloc = MockTopRatedMovieBloc();
    mockMovieDetailBloc = MockMovieDetailBloc();
    mockWatchlistMovieEventBloc = MockWatchlistMovieEventBloc();
    mockWatchlistMovieStatusBloc = MockWatchlistMovieStatusBloc();
    mockRecomendationMovieBloc = MockRecomendationMovieBloc();
    mockMovieSearchBloc = MockMovieSearchBloc();
    mockWatchlistMovieBloc = MockWatchlistMovieBloc();

    //Tv
    mockPopularTvShowBloc = MockPopularTvShowBloc();
    mockNowPlayingTvShowBloc = MockNowPlayingTvShowBloc();
    mockTopRateTvShowBloc = MockTopRatedTvShowBloc();
    mockWatchlistEventBloc = MockWatchlistEventBloc();
    mockTvDetailBloc = MockTvDetailBloc();
    mockWatchlistStatusBloc = MockWatchlistStatusBloc();
    mockRecomendationTvShowBloc = MockRecomendationTvShowBloc();
    mockTvSearchBloc = MockTvSearchBloc();
    mockWatchlistTVBloc = MockWatchlistTVBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WatchlistMovieBloc>.value(value: mockWatchlistMovieBloc),
        BlocProvider<SearchMovieBloc>.value(value: mockMovieSearchBloc),
        BlocProvider<MovieDetailBloc>.value(value: mockMovieDetailBloc),
        BlocProvider<WatchlistMovieEventBloc>.value(
            value: mockWatchlistMovieEventBloc),
        BlocProvider<WatchlistMovieStatusBloc>.value(
            value: mockWatchlistMovieStatusBloc),
        BlocProvider<RecomendationMovieBloc>.value(
            value: mockRecomendationMovieBloc),
        BlocProvider<PopularMovieBloc>.value(value: mockPopulerMovieBloc),
        BlocProvider<NowPlayingMovieBloc>.value(value: mockNowPlayingMovieBloc),
        BlocProvider<TopRatedMovieBloc>.value(value: mockTopRatedMovieBloc),
        BlocProvider<WatchlistTvShowBloc>.value(value: mockWatchlistTVBloc),
        BlocProvider<SearchTvShowBloc>.value(value: mockTvSearchBloc),
        BlocProvider<TvShowDetailBloc>.value(value: mockTvDetailBloc),
        BlocProvider<WatchlistEventBloc>.value(value: mockWatchlistEventBloc),
        BlocProvider<WatchlistStatusBloc>.value(value: mockWatchlistStatusBloc),
        BlocProvider<RecomendationTvShowBloc>.value(
            value: mockRecomendationTvShowBloc),
        BlocProvider<PopularTvShowBloc>.value(value: mockPopularTvShowBloc),
        BlocProvider<NowPlayingTvShowBloc>.value(
            value: mockNowPlayingTvShowBloc),
        BlocProvider<TopRateTvShowBloc>.value(value: mockTopRateTvShowBloc),
      ],
      child: MaterialApp(
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

  void arrangeReturn() {
    //popular
    when(() => mockPopulerMovieBloc.stream)
        .thenAnswer(((_) => Stream.value(PopularMovieLoaded(testMovieLists))));
    when(() => mockPopulerMovieBloc.state)
        .thenReturn(PopularMovieLoaded(testMovieLists));
    //now playing
    when(() => mockNowPlayingMovieBloc.stream)
        .thenAnswer((_) => Stream.value(NowPlayingMovieLoaded(testMovieList)));
    when(() => mockNowPlayingMovieBloc.state)
        .thenReturn(NowPlayingMovieLoaded(testMovieList));
    //top rated
    when(() => mockTopRatedMovieBloc.stream)
        .thenAnswer((_) => Stream.value(TopRatedMovieLoaded(testMovieList)));
    when(() => mockTopRatedMovieBloc.state)
        .thenReturn(TopRatedMovieLoaded(testMovieList));
    //tv detail
    when(() => mockMovieDetailBloc.stream)
        .thenAnswer(((_) => Stream.value(MovieDetailLoaded(testMovieDetail))));
    when(() => mockMovieDetailBloc.state)
        .thenReturn(MovieDetailLoaded(testMovieDetail));
    //watchlist event
    when(() => mockWatchlistMovieEventBloc.stream)
        .thenAnswer(((_) => Stream.value(WatchlistMovieEventInitial())));
    when(() => mockWatchlistMovieEventBloc.state)
        .thenReturn(WatchlistMovieEventInitial());
    //watchlist status
    when(() => mockWatchlistMovieStatusBloc.stream)
        .thenAnswer(((_) => Stream.value(WatchlistMovieStatusTrue())));
    when(() => mockWatchlistMovieStatusBloc.state)
        .thenReturn(WatchlistMovieStatusTrue());
    //recomendation
    when(() => mockRecomendationMovieBloc.stream).thenAnswer(
        ((_) => Stream.value(RecomendationMovieLoaded(testMovieList))));
    when(() => mockRecomendationMovieBloc.state)
        .thenReturn(RecomendationMovieLoaded(testMovieList));
  }

  testWidgets(
    """tapping on the first movie excerpt opens the movie detail page
       where full informasion of movie will display""",
    (WidgetTester tester) async {
      arrangeReturn();
      await tester.pumpWidget(_makeTestableWidget(HomeMoviePage()));

      await tester.pump();

      await tester.tap(find.byKey(Key('Lion-Man')));

      for (int i = 0; i < 5; i++) {
        // because pumpAndSettle doesn't work with riverpod
        await tester.pump(Duration(seconds: 1));
      }

      expect(find.byType(HomeMoviePage), findsNothing);
      expect(find.byType(MovieDetailPage), findsOneWidget);

      expect(find.text('title'), findsOneWidget);
    },
  );

  testWidgets(
    """tapping on the 'See More' button excerpt opens the movie popular page
       where full informasion of movie will display""",
    (WidgetTester tester) async {
      arrangeReturn();
      await tester.pumpWidget(_makeTestableWidget(HomeMoviePage()));

      await tester.pump();

      await tester.tap(find.byKey(Key('popular')));

      for (int i = 0; i < 5; i++) {
        // because pumpAndSettle doesn't work with riverpod
        await tester.pump(Duration(seconds: 1));
      }

      expect(find.byType(HomeMoviePage), findsNothing);
      expect(find.byType(PopularMoviesPage), findsOneWidget);

      expect(find.text('Popular Movies'), findsOneWidget);
    },
  );

  testWidgets(
    """tapping on the 'See More' button excerpt opens the Top Rated Movie page
       where full informasion of movie will display""",
    (WidgetTester tester) async {
      arrangeReturn();
      await tester.pumpWidget(_makeTestableWidget(HomeMoviePage()));

      await tester.pump();

      await tester.tap(find.byKey(Key('top_rated')));

      for (int i = 0; i < 5; i++) {
        // because pumpAndSettle doesn't work with riverpod
        await tester.pump(Duration(seconds: 1));
      }

      expect(find.byType(HomeMoviePage), findsNothing);
      expect(find.byType(TopRatedMoviesPage), findsOneWidget);

      expect(find.text('Top Rated Movies'), findsOneWidget);
    },
  );
}
