import 'package:ditonton/common/db/database_helper.dart';
import 'package:ditonton/features/movies/data/datasources/movie_local_data_source.dart';
import 'package:ditonton/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:ditonton/features/movies/domain/repositories/movie_repository.dart';
import 'package:ditonton/features/tvs/data/datasources/tv_show_local_data_source.dart';
import 'package:ditonton/features/tvs/data/datasources/tv_show_remote_data_source.dart';
import 'package:ditonton/features/tvs/domain/repositories/tv_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  MovieRepository,
  TVRepository,
  TVShowRemoteDataSource,
  TvShowLocalDataSource,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
