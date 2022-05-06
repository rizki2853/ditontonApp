import 'package:ditonton/features/tvs/presentation/blocs/watchlist_tv_show/watchlist_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/pages/watchlist_tv_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../dummy_data/dummy_objects.dart';

class MockWatchlistTVBloc extends Mock implements WatchlistTvShowBloc {}

class FakeEvent extends Fake implements WatchlistTvShowEvent {}

class FakeState extends Fake implements WatchlistTvShowState {}

void main() {
  late MockWatchlistTVBloc bloc;

  setUpAll(() {
    registerFallbackValue(FakeEvent());
    registerFallbackValue(FakeState());
  });

  setUp(() {
    bloc = MockWatchlistTVBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<WatchlistTvShowBloc>.value(
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
          .thenAnswer((_) => Stream.value(WatchlistTvShowStateLoading()));
      when(() => bloc.state).thenReturn(WatchlistTvShowStateLoading());

      final progressFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(WatchlistTvPage()));

      expect(progressFinder, findsOneWidget);
      expect(centerFinder, findsWidgets);
    },
  );

  testWidgets(
    "Page should display ListView when data is loaded",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer((_) => Stream.value(WatchlistTvShowStateLoaded(tTvList)));
      when(() => bloc.state).thenReturn(WatchlistTvShowStateLoaded(tTvList));

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(WatchlistTvPage()));

      expect(listViewFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Page should display text with message when Error",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer((_) => Stream.value(WatchlistTvShowStateError(tError)));
      when(() => bloc.state).thenReturn(WatchlistTvShowStateError(tError));

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget(WatchlistTvPage()));

      expect(textFinder, findsOneWidget);
    },
  );
}
