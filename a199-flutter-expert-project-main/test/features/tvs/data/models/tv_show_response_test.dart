import 'dart:convert';
import 'package:ditonton/features/tvs/data/models/tv_show_model.dart';
import 'package:ditonton/features/tvs/data/models/tv_show_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../json_reader.dart';

void main() {
  final model = TVShowModel(
    posterPath: "/vC324sdfcS313vh9QXwijLIHPJp.jpg",
    popularity: 4,
    id: 31917,
    backdropPath: "/rQGBjWNveVeF8f2PGRtS85w9o9r.jpg",
    voteAverage: 5,
    overview:
        "Based on the Pretty Little Liars series of young adult novels by Sara Shepard, the series follows the lives of four girls — Spencer, Hanna, Aria, and Emily — whose clique falls apart after the disappearance of their queen bee, Alison. One year later, they begin receiving messages from someone using the name \"A\" who threatens to expose their secrets — including long-hidden ones they thought only Alison knew.",
    firstAirDate: "2010-06-08",
    genreIds: [18, 9648],
    name: "Pretty Little Liars",
    originalCountry: ["US"],
    originalLanguage: "en",
    originalName: "Pretty Little Liars",
    voteCount: 133,
  );

  final tTvShowResponseModel = TvResponse(tvShowList: <TVShowModel>[model]);

  group(
    'fromJson test',
    () {
      test(
        'Should return a valid model from JSON',
        () {
          // arrange
          final Map<String, dynamic> jsonMap =
              json.decode(readJson('dummy_data/tv_show_list.json'));
          // act
          final result = TvResponse.fromJson(jsonMap);
          // asset
          expect(result, tTvShowResponseModel);
        },
      );
    },
  );

  group(
    'toJson test',
    () {
      test(
        'Should return a JSON map containing proper data',
        () {
          // act
          final result = tTvShowResponseModel.toJson();
          // asset
          final expectedJsonMap = {
            "results": [
              {
                "poster_path": "/vC324sdfcS313vh9QXwijLIHPJp.jpg",
                "popularity": 4,
                "id": 31917,
                "backdrop_path": "/rQGBjWNveVeF8f2PGRtS85w9o9r.jpg",
                "vote_average": 5,
                "overview":
                    "Based on the Pretty Little Liars series of young adult novels by Sara Shepard, the series follows the lives of four girls — Spencer, Hanna, Aria, and Emily — whose clique falls apart after the disappearance of their queen bee, Alison. One year later, they begin receiving messages from someone using the name \"A\" who threatens to expose their secrets — including long-hidden ones they thought only Alison knew.",
                "first_air_date": "2010-06-08",
                "origin_country": ["US"],
                "genre_ids": [18, 9648],
                "original_language": "en",
                "vote_count": 133,
                "name": "Pretty Little Liars",
                "original_name": "Pretty Little Liars",
              }
            ],
          };
          expect(result, expectedJsonMap);
        },
      );
    },
  );
}
