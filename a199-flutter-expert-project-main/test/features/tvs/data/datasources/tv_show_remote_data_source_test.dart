import 'dart:convert';
import 'dart:io';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/features/tvs/data/datasources/tv_show_remote_data_source.dart';
import 'package:ditonton/features/tvs/data/models/tv_show_detail_model.dart';
import 'package:ditonton/features/tvs/data/models/tv_show_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../../helpers/test_helper.mocks.dart';
import '../../../../json_reader.dart';

void main() {
  const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const BASE_URL = 'https://api.themoviedb.org/3';

  late TVShowRemoteDataSource dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = TVShowRemoteDataSourceImpl(client: mockHttpClient);
  });

  final tTvShowList =
      TvResponse.fromJson(json.decode(readJson('dummy_data/tv_show_list.json')))
          .tvShowList;

  group("getNowPlayingTvShow test", () {
    test("should return list of Tv Model when the response code is 200",
        () async {
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/tv_show_list.json'), 200,
                  headers: {
                    HttpHeaders.contentTypeHeader:
                        'application/json; charset=utf-8',
                  }));

      final result = await dataSource.getNowPlayingTvShow();
      expect(result, equals(tTvShowList));
    });

    test(
      'Should return no failure when response statuscode not 200',
      () {
        // arrange
        when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY')))
            .thenAnswer((_) async => http.Response("Not Found", 404));
        // act
        final result = dataSource.getNowPlayingTvShow();
        // asset
        expect(() => result, throwsA(isA<ServerException>()));
      },
    );
  });

  group(
    'getPopularTvShow test',
    () {
      test(
        'Should return list of tv model when the response statuscode is 200',
        () async {
          // arrange
          when(mockHttpClient.get(Uri.parse("$BASE_URL/tv/popular?$API_KEY")))
              .thenAnswer((_) async => http.Response(
                      readJson("dummy_data/tv_show_list.json"), 200,
                      headers: {
                        HttpHeaders.contentTypeHeader:
                            'application/json; charset=utf-8',
                      }));
          // act
          final result = await dataSource.getPopularTvShow();
          // asset
          expect(result, equals(tTvShowList));
        },
      );

      test(
        'Should return failure when response status code is not 200',
        () {
          // arrange
          when(mockHttpClient.get(Uri.parse("$BASE_URL/tv/popular?$API_KEY")))
              .thenAnswer((_) async => http.Response("404 Not Found", 404));
          // act
          final result = dataSource.getPopularTvShow();
          // asset
          expect(result, throwsA(isA<ServerException>()));
        },
      );
    },
  );

  group(
    'getTopRateTvShow test',
    () {
      test(
        'Should return a list of tv show when response statuscode is 200',
        () async {
          // arrange
          when(mockHttpClient.get(Uri.parse("$BASE_URL/tv/top_rated?$API_KEY")))
              .thenAnswer((_) async => http.Response(
                      readJson("dummy_data/tv_show_list.json"), 200,
                      headers: {
                        HttpHeaders.contentTypeHeader:
                            'application/json; charset=utf-8',
                      }));
          // act
          final result = await dataSource.getTopRateTvShow();
          // asset
          expect(result, equals(tTvShowList));
        },
      );

      test(
        'Should return failure when response statuscode is not 200',
        () async {
          // arrange
          when(mockHttpClient.get(Uri.parse("$BASE_URL/tv/top_rated?$API_KEY")))
              .thenAnswer((_) async => http.Response("404 Not Found", 404));
          // act
          final result = dataSource.getTopRateTvShow();
          // asset
          expect(result, throwsA(isA<ServerException>()));
        },
      );
    },
  );

  group(
    'GetTvShowDetail test',
    () {
      final tId = 1;
      final tTvShowDetail = TvShowDetailModel.fromJson(
          json.decode(readJson('dummy_data/tv_show_detail.json')));

      test(
        'Should return a list of tv show when response statuscode is 200',
        () async {
          // arrange
          when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$tId?$API_KEY')))
              .thenAnswer((_) async => http.Response(
                      readJson("dummy_data/tv_show_detail.json"), 200,
                      headers: {
                        HttpHeaders.contentTypeHeader:
                            'application/json; charset=utf-8',
                      }));
          // act
          final result = await dataSource.getTvDetail(tId);
          // asset
          expect(result, equals(tTvShowDetail));
        },
      );
    },
  );
}
