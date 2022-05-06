import 'dart:convert';

import 'package:ditonton/features/tvs/data/models/tv_show_model.dart';
import 'package:ditonton/features/tvs/domain/entities/tv.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/dummy_objects.dart';

void main() {
  test("should be a subclass off entitie", () {
    expect(tTvModel, isA<TV>());
  });

  group("fromJson", (() {
    test("should return valid model", () {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString('tv_popular.json'));

      final result = TVShowModel.fromJson(jsonMap);

      expect(result, tTvModel);
    });
  }));

  group("toJson", () {
    test("should return jsonMap", () {
      final expectedMap = {
        "poster_path": "test",
        "popularity": 1,
        "id": 1,
        "backdrop_path": "test",
        "vote_average": 1,
        "overview": "test",
        "first_air_date": "test",
        "origin_country": ["test"],
        "genre_ids": [1],
        "original_language": "test",
        "vote_count": 1,
        "name": "test",
        "original_name": "test"
      };

      final result = tTvModel.toJson();
      expect(result, expectedMap);
    });
  });
}
