import 'dart:convert';
import 'package:ditonton/features/tvs/data/models/seasons_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/dummy_objects.dart';

void main() {
  group("fromJson", (() {
    test("should return valid model", () {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString('season.json'));

      final result = SeasonsModel.fromJson(jsonMap);

      expect(result, tSeasonModel);
    });
  }));

  group("toJson", () {
    test("should return jsonMap", () {
      final expectedMap = {
        "air_date": "2010-12-05",
        "episode_count": 64,
        "id": 3627,
        "name": "Specials",
        "overview": "",
        "poster_path": "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg",
        "season_number": 0
      };

      final result = tSeasonModel.toJson();
      expect(result, expectedMap);
    });
  });
}
