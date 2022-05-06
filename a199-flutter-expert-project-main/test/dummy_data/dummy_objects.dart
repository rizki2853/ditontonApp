import 'dart:io';
import 'package:ditonton/features/movies/data/models/genre_model.dart';
import 'package:ditonton/features/movies/data/models/movie_detail_model.dart';
import 'package:ditonton/features/movies/data/models/movie_table.dart';
import 'package:ditonton/features/movies/domain/entities/genre.dart';
import 'package:ditonton/features/movies/domain/entities/movie.dart';
import 'package:ditonton/features/movies/domain/entities/movie_detail.dart';
import 'package:ditonton/features/tvs/data/models/seasons_model.dart';
import 'package:ditonton/features/tvs/data/models/tv_show_detail_model.dart';
import 'package:ditonton/features/tvs/data/models/tv_show_model.dart';
import 'package:ditonton/features/tvs/data/models/tv_table.dart';
import 'package:ditonton/features/tvs/domain/entities/season.dart';
import 'package:ditonton/features/tvs/domain/entities/tv.dart';
import 'package:ditonton/features/tvs/domain/entities/tv_show_detail.dart';

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

final tTvList = <TV>[];

final tId = 1;

final tQuery = "Kimi no nawa";

final tTvDetail = TVShowDetail(
  episodeRunTime: [60],
  backdropPath: "/suopoADq0k8YZr4dQXcU6pToj6s.jpg",
  genres: [Genre(id: 10765, name: "Sci-Fi & Fantasy")],
  id: 1399,
  originalName: "Game of Thrones",
  overview:
      "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
  posterPath: "/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg",
  releaseDate: "2010-12-05",
  name: "Game of Thrones",
  voteAverage: 8.3,
  voteCount: 11504,
  seasons: [
    Season(
      airDate: "2010-12-05",
      episodeCount: 64,
      id: 3627,
      name: "Specials",
      overview: "",
      posterPath: "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg",
      seasonNumber: 0,
    ),
  ],
);

final testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final tMovieDetailModel = MovieDetailResponse(
  adult: false,
  backdropPath: "/path.jpg",
  budget: 100,
  genres: [GenreModel(id: 1, name: "Action")],
  homepage: "https://google.com",
  id: 1,
  imdbId: "imdb1",
  originalLanguage: "en",
  originalTitle: "Original Title",
  overview: "Overview",
  popularity: 1.0,
  posterPath: "/path.jpg",
  releaseDate: "2020-05-05",
  revenue: 12000,
  runtime: 120,
  status: "Status",
  tagline: "Tagline",
  title: "Title",
  video: false,
  voteAverage: 1.0,
  voteCount: 1,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

final tTvTable = TvTable(
  id: 1399,
  name: "Game of Thrones",
  posterPath: "/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg",
  overview:
      "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
);

final tWatchlistTv = TV.watchlist(
  id: 1399,
  name: "Game of Thrones",
  posterPath: "/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg",
  overview:
      "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
);

final tTvMap = {
  'id': 1399,
  'name': "Game of Thrones",
  'posterPath': "/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg",
  'overview':
      "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
};

final tTv = TV(
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

final tTvModel = TVShowModel(
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

final tTvDetailModel = TvShowDetailModel(
    episodeRunTime: [60],
    backdropPath: "/suopoADq0k8YZr4dQXcU6pToj6s.jpg",
    genres: [GenreModel(id: 10765, name: "Sci-Fi & Fantasy")],
    id: 1399,
    originalName: "Game of Thrones",
    overview:
        "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
    posterPath: "/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg",
    releaseDate: "2010-12-05",
    name: "Game of Thrones",
    voteAverage: 8.3,
    voteCount: 11504,
    seasons: [
      SeasonsModel(
        airDate: "2010-12-05",
        episodeCount: 64,
        id: 3627,
        name: "Specials",
        overview: "",
        posterPath: "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg",
        seasonNumber: 0,
      ),
    ]);
final tError = 'Server Failure';

final tGenreModel = GenreModel(id: 1, name: "name");

final tSeasonModel = SeasonsModel(
  airDate: "2010-12-05",
  episodeCount: 64,
  id: 3627,
  name: "Specials",
  overview: "",
  posterPath: "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg",
  seasonNumber: 0,
);
String jsonString(String name) =>
    File("test/dummy_data/$name").readAsStringSync();
