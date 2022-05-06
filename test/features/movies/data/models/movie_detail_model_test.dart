import 'dart:convert';
import 'package:ditonton/features/movies/data/models/movie_detail_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/dummy_objects.dart';

void main() {
  group("fromJson", (() {
    test("should return valid model", () {
      Map<String, dynamic> jsonMap =
          jsonDecode(jsonString('movie_detail.json'));

      final result = MovieDetailResponse.fromJson(jsonMap);

      expect(result, tMovieDetailModel);
    });
  }));

  group("toJson", () {
    test("should return jsonMap", () {
      final expectedMap = {
        "adult": false,
        "backdrop_path": "/path.jpg",
        "budget": 100,
        "genres": [
          {"id": 1, "name": "Action"}
        ],
        "homepage": "https://google.com",
        "id": 1,
        "imdb_id": "imdb1",
        "original_language": "en",
        "original_title": "Original Title",
        "overview": "Overview",
        "popularity": 1.0,
        "poster_path": "/path.jpg",
        "release_date": "2020-05-05",
        "revenue": 12000,
        "runtime": 120,
        "status": "Status",
        "tagline": "Tagline",
        "title": "Title",
        "video": false,
        "vote_average": 1.0,
        "vote_count": 1
      };

      final result = tMovieDetailModel.toJson();
      expect(result, expectedMap);
    });
  });
}
