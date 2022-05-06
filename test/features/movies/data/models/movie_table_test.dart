import 'package:ditonton/features/movies/data/models/movie_table.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/dummy_objects.dart';

void main() {
  group("fromEntiti", (() {
    test("should return valid model", () {
      final result = MovieTable.fromEntity(testMovieDetail);
      expect(result, testMovieTable);
    });
  }));

  group("fromMap", () {
    test("should return valid model", () {
      final result = MovieTable.fromMap(testMovieMap);
      expect(result, testMovieTable);
    });
  });

  group("toJson", () {
    test("should return jsonMap", () {
      final result = testMovieTable.toJson();
      expect(result, testMovieMap);
    });
  });
}
