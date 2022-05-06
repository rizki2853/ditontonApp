import 'package:ditonton/features/tvs/presentation/blocs/search_tv_show/search_tv_show_bloc.dart';
import 'package:ditonton/features/tvs/presentation/pages/tv_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../dummy_data/dummy_objects.dart';

class MockTvSearchBloc extends Mock implements SearchTvShowBloc {}

class FakeEvent extends Fake implements SearchTvShowEvent {}

class FakeState extends Fake implements SearchTvShowState {}

void main() {
  late MockTvSearchBloc bloc;

  setUpAll(() {
    registerFallbackValue(FakeEvent());
    registerFallbackValue(FakeState());
  });

  setUp(() {
    bloc = MockTvSearchBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<SearchTvShowBloc>.value(
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
          .thenAnswer((_) => Stream.value(SearchTvShowStateLoaded(tTvList)));
      when(() => bloc.state).thenReturn(SearchTvShowStateLoaded(tTvList));

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(TVSearchPage()));

      expect(listViewFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Page should display progress bar when loading",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer((_) => Stream.value(SearchTvShowStateLoading()));
      when(() => bloc.state).thenReturn(SearchTvShowStateLoading());

      final progresBarFinder = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(TVSearchPage()));

      expect(progresBarFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Page should display error message when error",
    (WidgetTester tester) async {
      when(() => bloc.stream)
          .thenAnswer((_) => Stream.value(SearchTvShowStateError(tError)));
      when(() => bloc.state).thenReturn(SearchTvShowStateError(tError));

      final textFinder = find.text(tError);

      await tester.pumpWidget(_makeTestableWidget(TVSearchPage()));

      expect(textFinder, findsOneWidget);
    },
  );
}
