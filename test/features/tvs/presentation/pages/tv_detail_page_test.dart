import 'package:ditonton/features/tvs/presentation/blocs/recomendation_tv_show/recomendation_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/tv_show_detail/tv_show_detail_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/watchlist_event/watchlist_event_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/watchlist_status/watchlist_status_bloc.dart';
import 'package:ditonton/features/tvs/presentation/pages/tv_show_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../dummy_data/dummy_objects.dart';

class MockTvDetailBloc extends Mock implements TvShowDetailBloc {}

class TvDetailStateFake extends Fake implements TvShowDetailState {}

class TvDetailEventFake extends Fake implements TvShowDetailEvent {}

class MockWatchlistEventBloc extends Mock implements WatchlistEventBloc {}

class WatchlistEventFake extends Fake implements WatchlistEventEvent {}

class WatchlistStateFake extends Fake implements WatchlistEventState {}

class MockWatchlistStatusBloc extends Mock implements WatchlistStatusBloc {}

class WatchlistStatusEventFake extends Fake implements WatchlistStatusEvent {}

class WatchlistStatusStateFake extends Fake implements WatchlistStatusState {}

class MockRecomendationTvShowBloc extends Mock
    implements RecomendationTvShowBloc {}

class RecomendationTvShowStateFake extends Fake
    implements RecomendationTvShowState {}

class RecomendationTvShowEventFake extends Fake
    implements RecomendationTvShowEvent {}

void main() {
  late MockWatchlistEventBloc mockWatchlistEventBloc;
  late MockTvDetailBloc mockTvDetailBloc;
  late MockWatchlistStatusBloc mockWatchlistStatusBloc;
  late MockRecomendationTvShowBloc mockRecomendationTvShowBloc;

  setUpAll(() {
    registerFallbackValue(TvDetailStateFake());
    registerFallbackValue(TvDetailEventFake());
    registerFallbackValue(WatchlistEventFake());
    registerFallbackValue(WatchlistStateFake());
    registerFallbackValue(WatchlistStatusEventFake());
    registerFallbackValue(WatchlistStatusStateFake());
    registerFallbackValue(RecomendationTvShowEventFake());
    registerFallbackValue(RecomendationTvShowStateFake());
  });

  setUp(() {
    mockWatchlistStatusBloc = MockWatchlistStatusBloc();
    mockTvDetailBloc = MockTvDetailBloc();
    mockWatchlistEventBloc = MockWatchlistEventBloc();
    mockRecomendationTvShowBloc = MockRecomendationTvShowBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvShowDetailBloc>.value(value: mockTvDetailBloc),
        BlocProvider<WatchlistEventBloc>.value(value: mockWatchlistEventBloc),
        BlocProvider<WatchlistStatusBloc>.value(value: mockWatchlistStatusBloc),
        BlocProvider<RecomendationTvShowBloc>.value(
            value: mockRecomendationTvShowBloc),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    "Page should display progress bar when loading",
    (WidgetTester tester) async {
      //tv detail
      when(() => mockTvDetailBloc.stream)
          .thenAnswer(((_) => Stream.value(TvShowDetailStateLoading())));
      when(() => mockTvDetailBloc.state).thenReturn(TvShowDetailStateLoading());
      //watchlist event
      when(() => mockWatchlistEventBloc.stream)
          .thenAnswer(((_) => Stream.value(WatchlistEventStateEmpty())));
      when(() => mockWatchlistEventBloc.state)
          .thenReturn(WatchlistEventStateEmpty());
      //watchlist status
      when(() => mockWatchlistStatusBloc.stream)
          .thenAnswer(((_) => Stream.value(WatchlistStatusInitial())));
      when(() => mockWatchlistStatusBloc.state)
          .thenReturn(WatchlistStatusInitial());
      //recomendation
      when(() => mockRecomendationTvShowBloc.stream)
          .thenAnswer(((_) => Stream.value(RecomendationTvShowStateLoading())));
      when(() => mockRecomendationTvShowBloc.state)
          .thenReturn(RecomendationTvShowStateLoading());

      final progressFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);
      await tester.pumpWidget(_makeTestableWidget(TvShowDetailPage(id: tId)));

      expect(progressFinder, findsOneWidget);
      expect(centerFinder, findsWidgets);
    },
  );

  testWidgets(
    "display poster as background",
    (WidgetTester tester) async {
      //tv detail
      when(() => mockTvDetailBloc.stream).thenAnswer(
          ((_) => Stream.value(TvShowDetailStateLoaded(tTvDetail))));
      when(() => mockTvDetailBloc.state)
          .thenReturn(TvShowDetailStateLoaded(tTvDetail));
      //watchlist event
      when(() => mockWatchlistEventBloc.stream)
          .thenAnswer(((_) => Stream.value(WatchlistEventStateEmpty())));
      when(() => mockWatchlistEventBloc.state)
          .thenReturn(WatchlistEventStateEmpty());
      //watchlist status
      when(() => mockWatchlistStatusBloc.stream)
          .thenAnswer(((_) => Stream.value(WatchlistStatusTrue())));
      when(() => mockWatchlistStatusBloc.state)
          .thenReturn(WatchlistStatusTrue());
      //recomendation
      when(() => mockRecomendationTvShowBloc.stream).thenAnswer(
          ((_) => Stream.value(RecomendationTvShowStateLoaded(tTvList))));
      when(() => mockRecomendationTvShowBloc.state)
          .thenReturn(RecomendationTvShowStateLoaded(tTvList));

      final watchlistButtonIcon = find.byKey(Key("background_image"));

      await tester.pumpWidget(_makeTestableWidget(TvShowDetailPage(id: 1)));

      expect(watchlistButtonIcon, findsOneWidget);
    },
  );

  testWidgets(
    "Watchlist button should display check icon when tv is added to watchlist",
    (WidgetTester tester) async {
      //tv detail
      when(() => mockTvDetailBloc.stream).thenAnswer(
          ((_) => Stream.value(TvShowDetailStateLoaded(tTvDetail))));
      when(() => mockTvDetailBloc.state)
          .thenReturn(TvShowDetailStateLoaded(tTvDetail));
      //watchlist event
      when(() => mockWatchlistEventBloc.stream)
          .thenAnswer(((_) => Stream.value(WatchlistEventStateEmpty())));
      when(() => mockWatchlistEventBloc.state)
          .thenReturn(WatchlistEventStateEmpty());
      //watchlist status
      when(() => mockWatchlistStatusBloc.stream)
          .thenAnswer(((_) => Stream.value(WatchlistStatusTrue())));
      when(() => mockWatchlistStatusBloc.state)
          .thenReturn(WatchlistStatusTrue());
      //recomendation
      when(() => mockRecomendationTvShowBloc.stream).thenAnswer(
          ((_) => Stream.value(RecomendationTvShowStateLoaded(tTvList))));
      when(() => mockRecomendationTvShowBloc.state)
          .thenReturn(RecomendationTvShowStateLoaded(tTvList));

      final watchlistButtonIcon = find.byIcon(Icons.check);

      await tester.pumpWidget(_makeTestableWidget(TvShowDetailPage(id: 1)));

      expect(watchlistButtonIcon, findsOneWidget);
    },
  );

  testWidgets(
    "Watchlist button should display add icon when tv not added to watchlist",
    (WidgetTester tester) async {
      when(() => mockTvDetailBloc.stream).thenAnswer(
          ((_) => Stream.value(TvShowDetailStateLoaded(tTvDetail))));
      when(() => mockTvDetailBloc.state)
          .thenReturn(TvShowDetailStateLoaded(tTvDetail));
      //watchlist event
      when(() => mockWatchlistEventBloc.stream)
          .thenAnswer(((_) => Stream.value(WatchlistEventStateEmpty())));
      when(() => mockWatchlistEventBloc.state)
          .thenReturn(WatchlistEventStateEmpty());
      //watchlist status
      when(() => mockWatchlistStatusBloc.stream)
          .thenAnswer(((_) => Stream.value(WatchlistStatusFalse())));
      when(() => mockWatchlistStatusBloc.state)
          .thenReturn(WatchlistStatusFalse());
      //recomendation
      when(() => mockRecomendationTvShowBloc.stream).thenAnswer(
          ((_) => Stream.value(RecomendationTvShowStateLoaded(tTvList))));
      when(() => mockRecomendationTvShowBloc.state)
          .thenReturn(RecomendationTvShowStateLoaded(tTvList));

      final watchlistButtonIcon = find.byIcon(Icons.add);

      await tester.pumpWidget(_makeTestableWidget(TvShowDetailPage(id: 1)));

      expect(watchlistButtonIcon, findsOneWidget);
    },
  );

  testWidgets(
    "Watchlist button should display Snackbar when added to watchlist",
    (WidgetTester tester) async {
      when(() => mockTvDetailBloc.stream).thenAnswer(
          ((_) => Stream.value(TvShowDetailStateLoaded(tTvDetail))));
      when(() => mockTvDetailBloc.state)
          .thenReturn(TvShowDetailStateLoaded(tTvDetail));
      //watchlist event
      when(() => mockWatchlistEventBloc.stream).thenAnswer(((_) =>
          Stream.value(WatchlistEventStateLoaded('Added to Watchlist'))));
      when(() => mockWatchlistEventBloc.state)
          .thenReturn(WatchlistEventStateLoaded('Added to Watchlist'));
      //watchlist status
      when(() => mockWatchlistStatusBloc.stream)
          .thenAnswer(((_) => Stream.value(WatchlistStatusFalse())));
      when(() => mockWatchlistStatusBloc.state)
          .thenReturn(WatchlistStatusFalse());
      //recomendation
      when(() => mockRecomendationTvShowBloc.stream).thenAnswer(
          ((_) => Stream.value(RecomendationTvShowStateLoaded(tTvList))));
      when(() => mockRecomendationTvShowBloc.state)
          .thenReturn(RecomendationTvShowStateLoaded(tTvList));

      final watchlistButton = find.byType(ElevatedButton);

      await tester.pumpWidget(_makeTestableWidget(TvShowDetailPage(id: 1)));

      expect(find.byIcon(Icons.add), findsOneWidget);

      await tester.tap(watchlistButton);
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Added to Watchlist'), findsOneWidget);
    },
  );

  // testWidgets(
  //   "Watchlist button should display AlertDialog when add to watchlist failed",
  //   (WidgetTester tester) async {
  //     when(() => mockTvDetailBloc.stream).thenAnswer(
  //         ((_) => Stream.value(TvShowDetailStateLoaded(tTvDetail))));
  //     when(() => mockTvDetailBloc.state)
  //         .thenReturn(TvShowDetailStateLoaded(tTvDetail));
  //     //watchlist event
  //     when(() => mockWatchlistEventBloc.stream).thenAnswer(
  //         ((_) => Stream.value(WatchlistEventStateLoaded('Failed'))));
  //     when(() => mockWatchlistEventBloc.state)
  //         .thenReturn(WatchlistEventStateLoaded('Failed'));
  //     //watchlist status
  //     when(() => mockWatchlistStatusBloc.stream)
  //         .thenAnswer(((_) => Stream.value(WatchlistStatusFalse())));
  //     when(() => mockWatchlistStatusBloc.state)
  //         .thenReturn(WatchlistStatusFalse());
  //     //recomendation
  //     when(() => mockRecomendationTvShowBloc.stream).thenAnswer(
  //         ((_) => Stream.value(RecomendationTvShowStateLoaded(tTvList))));
  //     when(() => mockRecomendationTvShowBloc.state)
  //         .thenReturn(RecomendationTvShowStateLoaded(tTvList));

  //     final watchlistButton = find.byType(ElevatedButton);

  //     await tester.pumpWidget(_makeTestableWidget(TvShowDetailPage(id: tId)));

  //     expect(find.byIcon(Icons.add), findsOneWidget);

  //     await tester.tap(watchlistButton);
  //     await tester.pump();

  //     expect(find.byType(AlertDialog), findsOneWidget);
  //     expect(find.text('Failed'), findsOneWidget);
  //   },
  // );

  testWidgets(
    "Display rating of tv Show",
    (WidgetTester tester) async {
      when(() => mockTvDetailBloc.stream).thenAnswer(
          ((_) => Stream.value(TvShowDetailStateLoaded(tTvDetail))));
      when(() => mockTvDetailBloc.state)
          .thenReturn(TvShowDetailStateLoaded(tTvDetail));
      //watchlist event
      when(() => mockWatchlistEventBloc.stream).thenAnswer(
          ((_) => Stream.value(WatchlistEventStateLoaded('Failed'))));
      when(() => mockWatchlistEventBloc.state)
          .thenReturn(WatchlistEventStateLoaded('Failed'));
      //watchlist status
      when(() => mockWatchlistStatusBloc.stream)
          .thenAnswer(((_) => Stream.value(WatchlistStatusFalse())));
      when(() => mockWatchlistStatusBloc.state)
          .thenReturn(WatchlistStatusFalse());
      //recomendation
      when(() => mockRecomendationTvShowBloc.stream).thenAnswer(
          ((_) => Stream.value(RecomendationTvShowStateLoaded(tTvList))));
      when(() => mockRecomendationTvShowBloc.state)
          .thenReturn(RecomendationTvShowStateLoaded(tTvList));

      final ratingFinder = find.byType(RatingBarIndicator);

      await tester.pumpWidget(_makeTestableWidget(TvShowDetailPage(id: 1)));

      expect(ratingFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Display genres of tv Show",
    (WidgetTester tester) async {
      when(() => mockTvDetailBloc.stream).thenAnswer(
          ((_) => Stream.value(TvShowDetailStateLoaded(tTvDetail))));
      when(() => mockTvDetailBloc.state)
          .thenReturn(TvShowDetailStateLoaded(tTvDetail));
      //watchlist event
      when(() => mockWatchlistEventBloc.stream).thenAnswer(
          ((_) => Stream.value(WatchlistEventStateLoaded('Failed'))));
      when(() => mockWatchlistEventBloc.state)
          .thenReturn(WatchlistEventStateLoaded('Failed'));
      //watchlist status
      when(() => mockWatchlistStatusBloc.stream)
          .thenAnswer(((_) => Stream.value(WatchlistStatusFalse())));
      when(() => mockWatchlistStatusBloc.state)
          .thenReturn(WatchlistStatusFalse());
      //recomendation
      when(() => mockRecomendationTvShowBloc.stream).thenAnswer(
          ((_) => Stream.value(RecomendationTvShowStateLoaded(tTvList))));
      when(() => mockRecomendationTvShowBloc.state)
          .thenReturn(RecomendationTvShowStateLoaded(tTvList));

      final genreFinder = find.byKey(Key("Genres"));

      await tester.pumpWidget(_makeTestableWidget(TvShowDetailPage(id: 1)));

      expect(genreFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Display duration of tv Show",
    (WidgetTester tester) async {
      when(() => mockTvDetailBloc.stream).thenAnswer(
          ((_) => Stream.value(TvShowDetailStateLoaded(tTvDetail))));
      when(() => mockTvDetailBloc.state)
          .thenReturn(TvShowDetailStateLoaded(tTvDetail));
      //watchlist event
      when(() => mockWatchlistEventBloc.stream).thenAnswer(
          ((_) => Stream.value(WatchlistEventStateLoaded('Failed'))));
      when(() => mockWatchlistEventBloc.state)
          .thenReturn(WatchlistEventStateLoaded('Failed'));
      //watchlist status
      when(() => mockWatchlistStatusBloc.stream)
          .thenAnswer(((_) => Stream.value(WatchlistStatusFalse())));
      when(() => mockWatchlistStatusBloc.state)
          .thenReturn(WatchlistStatusFalse());
      //recomendation
      when(() => mockRecomendationTvShowBloc.stream).thenAnswer(
          ((_) => Stream.value(RecomendationTvShowStateLoaded(tTvList))));
      when(() => mockRecomendationTvShowBloc.state)
          .thenReturn(RecomendationTvShowStateLoaded(tTvList));

      final durationFinder = find.byKey(Key("Duration"));

      await tester.pumpWidget(_makeTestableWidget(TvShowDetailPage(id: 1)));

      expect(durationFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Display Season and episode count of tv Show",
    (WidgetTester tester) async {
      when(() => mockTvDetailBloc.stream).thenAnswer(
          ((_) => Stream.value(TvShowDetailStateLoaded(tTvDetail))));
      when(() => mockTvDetailBloc.state)
          .thenReturn(TvShowDetailStateLoaded(tTvDetail));
      //watchlist event
      when(() => mockWatchlistEventBloc.stream).thenAnswer(
          ((_) => Stream.value(WatchlistEventStateLoaded('Failed'))));
      when(() => mockWatchlistEventBloc.state)
          .thenReturn(WatchlistEventStateLoaded('Failed'));
      //watchlist status
      when(() => mockWatchlistStatusBloc.stream)
          .thenAnswer(((_) => Stream.value(WatchlistStatusFalse())));
      when(() => mockWatchlistStatusBloc.state)
          .thenReturn(WatchlistStatusFalse());
      //recomendation
      when(() => mockRecomendationTvShowBloc.stream).thenAnswer(
          ((_) => Stream.value(RecomendationTvShowStateLoaded(tTvList))));
      when(() => mockRecomendationTvShowBloc.state)
          .thenReturn(RecomendationTvShowStateLoaded(tTvList));

      final seasonTitle = find.text("Seasons");
      final seasonListView = find.byKey(Key("Seasons ListView"));

      await tester.pumpWidget(_makeTestableWidget(TvShowDetailPage(id: 1)));

      expect(seasonTitle, findsOneWidget);
      expect(seasonListView, findsOneWidget);
    },
  );
}
