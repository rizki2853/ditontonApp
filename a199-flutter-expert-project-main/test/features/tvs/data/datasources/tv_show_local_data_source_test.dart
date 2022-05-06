import 'package:ditonton/common/exception.dart';
import 'package:ditonton/features/tvs/data/datasources/tv_show_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockDatabaseHelper databaseHelper;
  late TvShowLocalDataSource dataSource;

  setUp(() {
    databaseHelper = MockDatabaseHelper();
    dataSource = TvShowLocalDataSourceImpl(databaseHelper: databaseHelper);
  });

  group(
    'remove watchlist test',
    () {
      test(
        'Should return success message when remove from database is success',
        () async {
          // arrange
          when(databaseHelper.removeWatchlist(tTvTable))
              .thenAnswer((_) async => 2);
          // act
          final result = await dataSource.removeWatchlist(tTvTable);
          // asset
          expect(result, 'Removed from Watchlist');
        },
      );

      test(
        'Should throw DatabaseException when remove from database is failed',
        () {
          // arrange
          when(databaseHelper.removeWatchlist(tTvTable)).thenThrow(Exception());
          // act
          final result = dataSource.removeWatchlist(tTvTable);
          // asset
          expect(() => result, throwsA(isA<DatabaseException>()));
        },
      );
    },
  );

  group(
    'save watchlist test',
    () {
      test(
        'Should return success message when insert to database is success',
        () async {
          // arrange
          when(databaseHelper.insertWatchlist(tTvTable))
              .thenAnswer((_) async => 2);
          // act
          final result = await dataSource.insertWatchlist(tTvTable);
          // asset
          expect(result, "Added to Watchlist");
        },
      );

      test(
        'Should throw DatabaseException when insert to database is failed',
        () {
          // arrange
          when(databaseHelper.insertWatchlist(tTvTable)).thenThrow(Exception());
          // act
          final result = dataSource.insertWatchlist(tTvTable);
          // asset
          expect(() => result, throwsA(isA<DatabaseException>()));
        },
      );
    },
  );

  group(
    'get watchlist Tv test',
    () {
      test(
        'Should return list of TvTable from database',
        () async {
          // arrange
          when(databaseHelper.getWatchlistMovies())
              .thenAnswer((_) async => [tTvMap]);
          // act
          final result = await dataSource.getWatchlistTv();
          // asset
          expect(result, [tTvTable]);
        },
      );
    },
  );

  group(
    'Get Tv Detail By Id test',
    () {
      test(
        'Should return TV Detail Table when data is found',
        () async {
          // arrange
          when(databaseHelper.getMovieById(tId))
              .thenAnswer((_) async => tTvMap);
          // act
          final result = await dataSource.getTvById(tId);
          // asset
          expect(result, tTvTable);
        },
      );

      test(
        'Should return null when data is not found',
        () async {
          // arrange
          when(databaseHelper.getMovieById(tId)).thenAnswer((_) async => null);
          // act
          final result = await dataSource.getTvById(tId);
          // asset
          expect(result, null);
        },
      );
    },
  );
}
