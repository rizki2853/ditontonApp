import 'package:ditonton/features/movies/presentation/blocs/top_rated_movie/top_rated_movie_bloc.dart';
import 'package:ditonton/features/movies/presentation/pages/top_rated_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../dummy_data/dummy_objects.dart';

class MockTopRatedMovieBloc extends Mock implements TopRatedMovieBloc {}

class TopRatedMovieStateFake extends Fake implements TopRatedMovieState {}

class TopRatedMovieEventFake extends Fake implements TopRatedMovieEvent {}

void main() {
  late MockTopRatedMovieBloc bloc;

  setUpAll(() {
    registerFallbackValue(TopRatedMovieEventFake());
    registerFallbackValue(TopRatedMovieStateFake());
  });

  setUp(() {
    bloc = MockTopRatedMovieBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TopRatedMovieBloc>.value(
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
          .thenAnswer((_) => Stream.value(TopRatedMovieLoading()));
      when(() => bloc.state).thenReturn(TopRatedMovieLoading());

      final progressFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

      expect(centerFinder, findsOneWidget);
      expect(progressFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Page should display when data is loaded",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer((_) => Stream.value(TopRatedMovieLoaded(testMovieList)));
      when(() => bloc.state).thenReturn(TopRatedMovieLoaded(testMovieList));

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

      expect(listViewFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Page should display text with message when Error",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer((_) => Stream.value(TopRatedMovieError(tError)));
      when(() => bloc.state).thenReturn(TopRatedMovieError(tError));

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

      expect(textFinder, findsOneWidget);
    },
  );
}
