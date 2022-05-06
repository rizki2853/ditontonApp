import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/features/tvs/data/models/tv_show_model.dart';
import 'package:ditonton/features/tvs/data/repositories/tv_repository_impl.dart';
import 'package:ditonton/features/tvs/domain/entities/tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late TVRepositoryImpl repository;
  late MockTVShowRemoteDataSource mockRemoteDataSource;
  late MockTvShowLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockTvShowLocalDataSource();
    mockRemoteDataSource = MockTVShowRemoteDataSource();
    repository = TVRepositoryImpl(
        localDataSource: mockLocalDataSource,
        remoteDataSource: mockRemoteDataSource);
  });

  final tTvShowModel = TVShowModel(
    posterPath: "test",
    popularity: 1,
    id: 1,
    backdropPath: "test",
    voteAverage: 1,
    overview: "test",
    firstAirDate: "test",
    genreIds: [1],
    name: "test",
    originalCountry: ["test"],
    originalLanguage: "test",
    originalName: "test",
    voteCount: 1,
  );

  final tTvshow = TV(
    posterPath: "test",
    popularity: 1,
    id: 1,
    backdropPath: "test",
    voteAverage: 1,
    overview: "test",
    firstAirDate: "test",
    genreIds: [1],
    name: "test",
    originalCountry: ["test"],
    originalLanguage: "test",
    originalName: "test",
    voteCount: 1,
  );

  final tTvShowModelList = <TVShowModel>[tTvShowModel];
  final tTvShowList = <TV>[tTvshow];

  group("nowPlayingTvShow test", () {
    test(
        "should return remote data when the call to remote data source is successful",
        () async {
      when(mockRemoteDataSource.getNowPlayingTvShow())
          .thenAnswer((_) async => tTvShowModelList);
      final result = await repository.getNowPlayingTvShow();
      verify(mockRemoteDataSource.getNowPlayingTvShow());
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvShowList);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getNowPlayingTvShow())
          .thenThrow(ServerException());
      // act
      final result = await repository.getNowPlayingTvShow();
      // assert
      verify(mockRemoteDataSource.getNowPlayingTvShow());
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getNowPlayingTvShow())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getNowPlayingTvShow();
      // assert
      verify(mockRemoteDataSource.getNowPlayingTvShow());
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group("PopularTvShow test", () {
    test(
        "should return remote data when the call to remote data source is successful",
        (() async {
      when(mockRemoteDataSource.getPopularTvShow())
          .thenAnswer((_) async => tTvShowModelList);

      final result = await repository.getPopularTvShow();
      verify(mockRemoteDataSource.getPopularTvShow());
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvShowList);
    }));

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvShow())
          .thenThrow(ServerException());
      // act
      final result = await repository.getPopularTvShow();
      // assert
      verify(mockRemoteDataSource.getPopularTvShow());
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvShow())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getPopularTvShow();
      // assert
      verify(mockRemoteDataSource.getPopularTvShow());
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group("TopRateTvShow test", () {
    test(
        "should return remote data when the call to remote data source is successful",
        (() async {
      when(mockRemoteDataSource.getTopRateTvShow())
          .thenAnswer((_) async => tTvShowModelList);

      final result = await repository.getTopRateTvShow();
      verify(mockRemoteDataSource.getTopRateTvShow());
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvShowList);
    }));

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRateTvShow())
          .thenThrow(ServerException());
      // act
      final result = await repository.getTopRateTvShow();
      // assert
      verify(mockRemoteDataSource.getTopRateTvShow());
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRateTvShow())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTopRateTvShow();
      // assert
      verify(mockRemoteDataSource.getTopRateTvShow());
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group(
    'SaveWatchList test',
    () {
      test(
        'Should return success message when saving successful',
        () async {
          // arrange
          when(mockLocalDataSource.insertWatchlist(tTvTable))
              .thenAnswer((_) async => "Added to Watchlist");
          // act
          final result = await repository.saveWatchlist(tTvDetail);
          // asset
          expect(result, Right("Added to Watchlist"));
        },
      );

      test(
        'Should return DatabaseFailure when saving unsuccessful',
        () async {
          // arrange
          when(mockLocalDataSource.insertWatchlist(tTvTable))
              .thenThrow(DatabaseException("Failed to add watchlist"));
          // act
          final result = await repository.saveWatchlist(tTvDetail);
          // asset
          expect(result, Left(DatabaseFailure('Failed to add watchlist')));
        },
      );
    },
  );

  group(
    'getWatchlistTv test',
    () {
      test(
        'Should return list of Movies',
        () async {
          // arrange
          when(mockLocalDataSource.getWatchlistTv())
              .thenAnswer((_) async => [tTvTable]);
          // act
          final result = await repository.getWatchlistTv();
          // asset
          final resultList = result.getOrElse(() => []);
          expect(resultList, [tWatchlistTv]);
        },
      );
    },
  );

  group(
    'isAddedToWatchlist test',
    () {
      test(
        'Should return watch status whether data is found',
        () async {
          // arrange
          when(mockLocalDataSource.getTvById(tId))
              .thenAnswer((_) async => tTvTable);
          // act
          final result = await repository.isAddedToWatchlist(tId);
          // asset
          expect(result, true);
        },
      );
    },
  );

  group(
    'removeWatchlist test',
    () {
      test(
        'Should return success message when remove successful',
        () async {
          // arrange
          when(mockLocalDataSource.removeWatchlist(tTvTable))
              .thenAnswer((_) async => "Removed from watchlist");
          // act
          final result = await repository.removeWatchlist(tTvDetail);
          // asset
          expect(result, Right("Removed from watchlist"));
        },
      );

      test(
        'Should return DatabaseFailure when remove unsuccessful',
        () async {
          // arrange
          when(mockLocalDataSource.removeWatchlist(tTvTable))
              .thenThrow(DatabaseException("Failed to remove watchlist"));
          // act
          final result = await repository.removeWatchlist(tTvDetail);
          // asset
          expect(result, Left(DatabaseFailure("Failed to remove watchlist")));
        },
      );
    },
  );

  group(
    'SearchTv test',
    () {
      test(
        'should return movie list when call to data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.searchTvs(tQuery))
              .thenAnswer((_) async => tTvShowModelList);
          // act
          final result = await repository.searchTvs(tQuery);
          // asset
          final resultList = result.getOrElse(() => []);
          expect(resultList, tTvShowList);
        },
      );

      test(
        'Should return ServerFailure when call to data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.searchTvs(tQuery))
              .thenThrow(ServerException());
          // act
          final result = await repository.searchTvs(tQuery);
          // asset
          expect(result, Left(ServerFailure("")));
        },
      );

      test(
        'Should return ConnectionFailure when device is not connected to the internet',
        () async {
          // arrange
          when(mockRemoteDataSource.searchTvs(tQuery))
              .thenThrow(SocketException("Failed to connect to the network"));
          // act
          final result = await repository.searchTvs(tQuery);
          // asset
          expect(result,
              Left(ConnectionFailure("Failed to connect to the network")));
        },
      );
    },
  );
}
