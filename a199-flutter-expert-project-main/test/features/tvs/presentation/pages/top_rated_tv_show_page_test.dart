import 'package:ditonton/features/tvs/presentation/blocs/top_rate_tv_show/top_rate_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/pages/top_rated_tv_show_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../dummy_data/dummy_objects.dart';

class MockTopRatedTvShowBloc extends Mock implements TopRateTvShowBloc {}

class FakeEvent extends Fake implements TopRateTvShowEvent {}

class FakeState extends Fake implements TopRateTvShowState {}

void main() {
  late MockTopRatedTvShowBloc bloc;

  setUpAll(() {
    registerFallbackValue(FakeEvent());
    registerFallbackValue(FakeState());
  });

  setUp(() {
    bloc = MockTopRatedTvShowBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TopRateTvShowBloc>.value(
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
          .thenAnswer((_) => Stream.value(TopRateTvShowStateLoading()));
      when(() => bloc.state).thenReturn(TopRateTvShowStateLoading());

      final progressFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(TopRatedTvShowPage()));

      expect(centerFinder, findsOneWidget);
      expect(progressFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Page should display when data is loaded",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer((_) => Stream.value(TopRateTvShowStateLoaded(tTvList)));
      when(() => bloc.state).thenReturn(TopRateTvShowStateLoaded(tTvList));

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(TopRatedTvShowPage()));

      expect(listViewFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Page should display text with message when Error",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer((_) => Stream.value(TopRateTvShowStateError(tError)));
      when(() => bloc.state).thenReturn(TopRateTvShowStateError(tError));

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget(TopRatedTvShowPage()));

      expect(textFinder, findsOneWidget);
    },
  );
}
