import 'package:app_peliculas/core/services/http_service.dart';
import 'package:app_peliculas/core/use_case/no_params.dart';
import 'package:app_peliculas/features/HomePage/data/data_sources/home_page_remote_data_source.dart';
import 'package:app_peliculas/features/HomePage/data/models/movie_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'home_page_remote_data_source_test.mocks.dart';

@GenerateMocks([HttpServiceBase])
Future<void> main() async {
  await dotenv.load(fileName: ".env");

  late HttpServiceBase httpMock;
  late HomePageRemoteDataSource remote;

  setUpAll(() {
    httpMock = MockHttpServiceBase();
    remote = HomePageRemoteDataSource(http: httpMock);
  });

  final movies = [
    MovieModel(
      id: 1,
      title: 'Avengers: Endgame',
      adult: false,
      backdroPath: '',
      genreIds: [],
      originalTitle: '',
      overview: '',
      popularity: 1,
      posterPath: '',
      releaseDate: '',
      video: false,
      voteAverage: 1,
      voteCount: 1,
    ),
  ];

  group('HomePageRemoteDataSource', () {
    group('getMoviesPopular', () {
      test('should received List<MovieModel>', () async {
        // Arrange
        final url =
            '${dotenv.get('TMBD_URL')}/movie/popular?language=en-US&page=1';
        final headers = {
          "accept": "application/json",
          "Authorization": "Bearer ${dotenv.get('API_KEY')}",
        };
        final data = {'results': movies.map((e) => e.toJson()).toList()};
        when(httpMock.get(url: url, headers: headers))
            .thenAnswer((_) async => data);
        final result = await remote.getMoviesPopular(NoParams());
        expect(result[0], isA<MovieModel>());
      });
    });

    group('getMoviesByName', () {
      test('should received List<MovieModel>', () async {
        final url =
            '${dotenv.get('TMBD_URL')}/search/movie?query=Avengers&language=es-US';
        final headers = {
          "accept": "application/json",
          "Authorization": "Bearer ${dotenv.get('API_KEY')}",
        };
        final data = {'results': movies.map((e) => e.toJson()).toList()};
        when(httpMock.get(url: url, headers: headers))
            .thenAnswer((_) async => data);
        final result = await remote.getMoviesByName(name: 'Avengers');
        expect(result[0], isA<MovieModel>());
      });
    });
  });
}
