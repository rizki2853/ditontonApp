import 'package:ditonton/features/tvs/presentation/blocs/now_playing_tv_show/now_playing_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/pages/now_playing_tv_show_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../dummy_data/dummy_objects.dart';

class MockNowPlayingTvShowBloc extends Mock implements NowPlayingTvShowBloc {}

class NowPlayingtvStateFake extends Fake implements NowPlayingTvShowState {}

class NowPlayingtvEventFake extends Fake implements NowPlayingTvShowEvent {}

void main() {
  late MockNowPlayingTvShowBloc bloc;

  setUpAll(() {
    registerFallbackValue(NowPlayingtvEventFake());
    registerFallbackValue(NowPlayingtvEventFake());
  });

  setUp(() {
    bloc = MockNowPlayingTvShowBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<NowPlayingTvShowBloc>.value(
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
          .thenAnswer((_) => Stream.value(NowPlayingStateLoading()));
      when(() => bloc.state).thenReturn(NowPlayingStateLoading());

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(NowPlayingTvShowPage()));

      expect(progressBarFinder, findsOneWidget);
      expect(centerFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Page should display ListView when data is loaded",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer((_) => Stream.value(NowPlayingStateLoaded(tTvList)));
      when(() => bloc.state).thenReturn(NowPlayingStateLoaded(tTvList));

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(NowPlayingTvShowPage()));

      expect(listViewFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Page should display text with message when Error",
    (WidgetTester tester) async {
      when(() => bloc.stream).thenAnswer(
          (_) => Stream.value(NowPlayingStateError("Error message")));
      when(() => bloc.state).thenReturn(NowPlayingStateError("Error message"));

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget(NowPlayingTvShowPage()));

      expect(textFinder, findsOneWidget);
    },
  );
}
