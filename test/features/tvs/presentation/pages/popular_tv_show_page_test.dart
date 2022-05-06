import 'package:ditonton/features/tvs/presentation/blocs/popular/popular_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/pages/popular_tv_show_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../dummy_data/dummy_objects.dart';

class MockPopularTvShowBloc extends Mock implements PopularTvShowBloc {}

class FakeEvent extends Fake implements PopularTvShowEvent {}

class FakeState extends Fake implements PopularTvShowState {}

void main() {
  late MockPopularTvShowBloc bloc;

  setUpAll(() {
    registerFallbackValue(FakeEvent());
    registerFallbackValue(FakeState());
  });

  setUp(() {
    bloc = MockPopularTvShowBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<PopularTvShowBloc>.value(
      value: bloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    "Page should display center progress bar when loading",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer(((_) => Stream.value(PopularTvShowStateLoading())));
      when(() => bloc.state).thenReturn(PopularTvShowStateLoading());

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(PopularTvShowPage()));

      expect(progressBarFinder, findsOneWidget);
      expect(centerFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Page should display ListView when data is loaded",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer(((_) => Stream.value(PopularTvShowStateLoaded(tTvList))));
      when(() => bloc.state).thenReturn(PopularTvShowStateLoaded(tTvList));

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(PopularTvShowPage()));

      expect(listViewFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Page should display text with message when Error",
    (WidgetTester tester) async {
      when(() => bloc.stream).thenAnswer(
          ((_) => Stream.value(PopularTvShowStateError('Server Failure'))));
      when(() => bloc.state)
          .thenReturn(PopularTvShowStateError('Server Failure'));

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget(PopularTvShowPage()));

      expect(textFinder, findsOneWidget);
    },
  );
}
