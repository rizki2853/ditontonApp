import 'package:ditonton/features/tvs/data/models/tv_table.dart';
import 'package:ditonton/features/tvs/domain/entities/tv.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/dummy_objects.dart';

void main() {
  group("fromMap", (() {
    test("should return valid model", () {
      final result = TvTable.fromMap(tTvMap);

      expect(result, tTvTable);
    });
  }));

  group("fromEntitie", (() {
    test("should return valid model", () {
      final result = TvTable.fromEntity(tTvDetail);

      expect(result, tTvTable);
    });
  }));

  group("toJson", () {
    test("should return jsonMap", () {
      final expectedMap = {
        "id": 1399,
        "name": "Game of Thrones",
        "posterPath": "/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg",
        "overview":
            "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond."
      };

      final result = tTvTable.toJson();
      expect(result, expectedMap);
    });
  });

  group("toEntitie", () {
    test("should return jsonMap", () {
      final expectedEntitie = TV.watchlist(
        id: 1399,
        name: "Game of Thrones",
        posterPath: "/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg",
        overview:
            "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
      );

      final result = tTvTable.toEntity();
      expect(result, expectedEntitie);
    });
  });
}
