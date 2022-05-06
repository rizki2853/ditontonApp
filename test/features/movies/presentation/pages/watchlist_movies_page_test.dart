import 'package:ditonton/features/movies/presentation/blocs/watchlist_movie/watchlist_movie_bloc.dart';
import 'package:ditonton/features/movies/presentation/pages/watchlist_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../dummy_data/dummy_objects.dart';

class MockWatchlistMovieBloc extends Mock implements WatchlistMovieBloc {}

class FakeEvent extends Fake implements WatchlistMovieEvent {}

class FakeState extends Fake implements WatchlistMovieState {}

void main() {
  late MockWatchlistMovieBloc bloc;

  setUpAll(() {
    registerFallbackValue(FakeEvent());
    registerFallbackValue(FakeState());
  });

  setUp(() {
    bloc = MockWatchlistMovieBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<WatchlistMovieBloc>.value(
      value: bloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    "Page should display progress bar when loading",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer((_) => Stream.value(WatchlistMovieLoading()));
      when(() => bloc.state).thenReturn(WatchlistMovieLoading());

      final progressFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));

      expect(progressFinder, findsOneWidget);
      expect(centerFinder, findsWidgets);
    },
  );

  testWidgets(
    "Page should display ListView when data is loaded",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer((_) => Stream.value(WatchlistMovieLoaded(testMovieList)));
      when(() => bloc.state).thenReturn(WatchlistMovieLoaded(testMovieList));

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));

      expect(listViewFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Page should display text with message when Error",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer((_) => Stream.value(WatchlistMovieError(tError)));
      when(() => bloc.state).thenReturn(WatchlistMovieError(tError));

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));

      expect(textFinder, findsOneWidget);
    },
  );
}
