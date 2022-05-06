import 'dart:convert';
import 'package:ditonton/features/tvs/data/models/tv_show_detail_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/dummy_objects.dart';

void main() {
  group("fromJson", (() {
    test("should return valid model", () {
      Map<String, dynamic> jsonMap =
          jsonDecode(jsonString('tv_show_detail.json'));

      final result = TvShowDetailModel.fromJson(jsonMap);

      expect(result, tTvDetailModel);
    });
  }));

  group("toJson", () {
    test("should return jsonMap", () {
      final expectedMap = {
        "backdrop_path": "/suopoADq0k8YZr4dQXcU6pToj6s.jpg",
        "episode_run_time": [60],
        "first_air_date": "2010-12-05",
        "genres": [
          {"id": 10765, "name": "Sci-Fi & Fantasy"}
        ],
        "id": 1399,
        "name": "Game of Thrones",
        "original_name": "Game of Thrones",
        "overview":
            "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
        "poster_path": "/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg",
        "seasons": [
          {
            "air_date": "2010-12-05",
            "episode_count": 64,
            "id": 3627,
            "name": "Specials",
            "overview": "",
            "poster_path": "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg",
            "season_number": 0
          }
        ],
        "vote_average": 8.3,
        "vote_count": 11504
      };

      final result = tTvDetailModel.toJson();
      expect(result, expectedMap);
    });
  });
}
