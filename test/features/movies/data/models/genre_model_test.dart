import 'dart:convert';
import 'package:ditonton/features/movies/data/models/genre_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/dummy_objects.dart';

void main() {
  group("fromJson", (() {
    test("should return valid model", () {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString('genre.json'));

      final result = GenreModel.fromJson(jsonMap);

      expect(result, tGenreModel);
    });
  }));

  group("toJson", () {
    test("should return jsonMap", () {
      final expectedMap = {"id": 1, "name": "name"};

      final result = tGenreModel.toJson();
      expect(result, expectedMap);
    });
  });
}
