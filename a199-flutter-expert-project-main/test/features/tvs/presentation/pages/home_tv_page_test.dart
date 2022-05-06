import 'package:ditonton/features/tvs/presentation/blocs/now_playing_tv_show/now_playing_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/popular/popular_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/blocs/top_rate_tv_show/top_rate_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/pages/home_tv_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../dummy_data/dummy_objects.dart';

class MockPopularTvShowBloc extends Mock implements PopularTvShowBloc {}

class FakePopularEvent extends Fake implements PopularTvShowEvent {}

class FakePopularState extends Fake implements PopularTvShowState {}

class MockTopRatedTvShowBloc extends Mock implements TopRateTvShowBloc {}

class FakeTopRatedEvent extends Fake implements TopRateTvShowEvent {}

class FakeTopRatedState extends Fake implements TopRateTvShowState {}

class MockNowPlayingTvShowBloc extends Mock implements NowPlayingTvShowBloc {}

class NowPlayingtvStateFake extends Fake implements NowPlayingTvShowState {}

class NowPlayingtvEventFake extends Fake implements NowPlayingTvShowEvent {}

void main() {
  late MockPopularTvShowBloc mockPopularTvShowBloc;
  late MockNowPlayingTvShowBloc mockNowPlayingTvShowBloc;
  late MockTopRatedTvShowBloc mockTopRateTvShowBloc;

  setUpAll(() {
    registerFallbackValue(FakePopularEvent());
    registerFallbackValue(FakePopularState());
    registerFallbackValue(FakeTopRatedEvent());
    registerFallbackValue(FakeTopRatedState());
    registerFallbackValue(NowPlayingtvStateFake());
    registerFallbackValue(NowPlayingtvEventFake());
  });

  setUp(() {
    mockPopularTvShowBloc = MockPopularTvShowBloc();
    mockNowPlayingTvShowBloc = MockNowPlayingTvShowBloc();
    mockTopRateTvShowBloc = MockTopRatedTvShowBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PopularTvShowBloc>.value(value: mockPopularTvShowBloc),
        BlocProvider<NowPlayingTvShowBloc>.value(
            value: mockNowPlayingTvShowBloc),
        BlocProvider<TopRateTvShowBloc>.value(value: mockTopRateTvShowBloc),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    "Page should display progress bar when loading",
    (WidgetTester tester) async {
      //popular
      when(() => mockPopularTvShowBloc.stream)
          .thenAnswer(((_) => Stream.value(PopularTvShowStateLoading())));
      when(() => mockPopularTvShowBloc.state)
          .thenReturn(PopularTvShowStateLoading());
      //now playing
      when(() => mockNowPlayingTvShowBloc.stream)
          .thenAnswer((_) => Stream.value(NowPlayingStateLoading()));
      when(() => mockNowPlayingTvShowBloc.state)
          .thenReturn(NowPlayingStateLoading());
      //top rated
      when(() => mockTopRateTvShowBloc.stream)
          .thenAnswer((_) => Stream.value(TopRateTvShowStateLoading()));
      when(() => mockTopRateTvShowBloc.state)
          .thenReturn(TopRateTvShowStateLoading());

      final progressFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(HomeTvPage()));

      expect(progressFinder, findsNWidgets(3));
      expect(centerFinder, findsWidgets);
    },
  );

  testWidgets(
    "Page should display ListView when data is loaded",
    (WidgetTester tester) async {
      when(() => mockPopularTvShowBloc.stream)
          .thenAnswer(((_) => Stream.value(PopularTvShowStateLoaded(tTvList))));
      when(() => mockPopularTvShowBloc.state)
          .thenReturn(PopularTvShowStateLoaded(tTvList));
      //now playing
      when(() => mockNowPlayingTvShowBloc.stream)
          .thenAnswer((_) => Stream.value(NowPlayingStateLoaded(tTvList)));
      when(() => mockNowPlayingTvShowBloc.state)
          .thenReturn(NowPlayingStateLoaded(tTvList));
      //top rated
      when(() => mockTopRateTvShowBloc.stream)
          .thenAnswer((_) => Stream.value(TopRateTvShowStateLoaded(tTvList)));
      when(() => mockTopRateTvShowBloc.state)
          .thenReturn(TopRateTvShowStateLoaded(tTvList));

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(HomeTvPage()));

      expect(listViewFinder, findsNWidgets(3));
    },
  );

  testWidgets(
    "Page should display text with message when Error",
    (WidgetTester tester) async {
      when(() => mockPopularTvShowBloc.stream)
          .thenAnswer(((_) => Stream.value(PopularTvShowStateError(tError))));
      when(() => mockPopularTvShowBloc.state)
          .thenReturn(PopularTvShowStateError(tError));
      //now playing
      when(() => mockNowPlayingTvShowBloc.stream)
          .thenAnswer((_) => Stream.value(NowPlayingStateError(tError)));
      when(() => mockNowPlayingTvShowBloc.state)
          .thenReturn(NowPlayingStateError(tError));
      //top rated
      when(() => mockTopRateTvShowBloc.stream)
          .thenAnswer((_) => Stream.value(TopRateTvShowStateError(tError)));
      when(() => mockTopRateTvShowBloc.state)
          .thenReturn(TopRateTvShowStateError(tError));

      final textFinder = find.text("Failed");

      await tester.pumpWidget(_makeTestableWidget(HomeTvPage()));

      expect(textFinder, findsNWidgets(3));
    },
  );
}
