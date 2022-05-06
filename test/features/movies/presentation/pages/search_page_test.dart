import 'package:ditonton/features/movies/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:ditonton/features/movies/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../dummy_data/dummy_objects.dart';

class MockMovieSearchBloc extends Mock implements SearchMovieBloc {}

class FakeEvent extends Fake implements SearchMovieEvent {}

class FakeState extends Fake implements SearchMovieState {}

void main() {
  late MockMovieSearchBloc bloc;

  setUpAll(() {
    registerFallbackValue(FakeEvent());
    registerFallbackValue(FakeState());
  });

  setUp(() {
    bloc = MockMovieSearchBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<SearchMovieBloc>.value(
      value: bloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    "Page should display ListView when data is loaded",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer((_) => Stream.value(SearchMovieLoaded(testMovieList)));
      when(() => bloc.state).thenReturn(SearchMovieLoaded(testMovieList));

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(SearchPage()));

      expect(listViewFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Page should display progress bar when loading",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer((_) => Stream.value(SearchMovieLoading()));
      when(() => bloc.state).thenReturn(SearchMovieLoading());

      final progresBarFinder = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(SearchPage()));

      expect(progresBarFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Page should display error message when error",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer((_) => Stream.value(SearchMovieError(tError)));
      when(() => bloc.state).thenReturn(SearchMovieError(tError));

      final textFinder = find.text(tError);

      await tester.pumpWidget(_makeTestableWidget(SearchPage()));

      expect(textFinder, findsOneWidget);
    },
  );
}
