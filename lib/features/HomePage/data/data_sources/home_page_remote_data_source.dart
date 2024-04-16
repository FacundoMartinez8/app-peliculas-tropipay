import 'package:app_peliculas/core/services/http_service.dart';
import 'package:app_peliculas/core/use_case/no_params.dart';
import 'package:app_peliculas/features/HomePage/data/models/movie_model.dart';
import 'package:app_peliculas/features/HomePage/domain/entity/movie.dart';
import 'package:app_peliculas/main.dart';

abstract class HomePageRemoteDataSourceBase {
  Future<List<Movie>> getMoviesPopular(NoParams noParams);

  Future<List<Movie>> getMoviesByName({required String name});
}

//@Injectable(as: HomePageRemoteDataSourceBase)
class HomePageRemoteDataSource implements HomePageRemoteDataSourceBase {
  final HttpServiceBase http;

  HomePageRemoteDataSource({required this.http});

  @override
  Future<List<Movie>> getMoviesPopular(NoParams noParams) async {
    final url = '$tmbdUrl/movie/popular?language=en-US&page=1';

    Map<String, String> headers = {
      "accept": "application/json",
      "Authorization": "Bearer $apiKey",
    };
    final result = await http.get(
      url: url,
      headers: headers,
    );

    return result['results'].map<Movie>((e) => MovieModel.fromJson(e)).toList();
  }

  @override
  Future<List<Movie>> getMoviesByName({required String name}) async {
    final url = '$tmbdUrl/search/movie?query=$name&language=es-US';

    Map<String, String> headers = {
      "accept": "application/json",
      "Authorization": "Bearer $apiKey",
    };
    final result = await http.get(
      url: url,
      headers: headers,
    );

    return result['results'].map<Movie>((e) => MovieModel.fromJson(e)).toList();
  }
}
