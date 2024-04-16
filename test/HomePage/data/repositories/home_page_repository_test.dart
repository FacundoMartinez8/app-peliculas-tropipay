import 'package:app_peliculas/core/failure/failure.dart';
import 'package:app_peliculas/core/use_case/no_params.dart';
import 'package:app_peliculas/features/HomePage/data/data_sources/home_page_remote_data_source.dart';
import 'package:app_peliculas/features/HomePage/data/models/movie_model.dart';
import 'package:app_peliculas/features/HomePage/data/repository/home_page_repository.dart';
import 'package:app_peliculas/features/HomePage/domain/repository/home_page_repository_base.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_page_repository_test.mocks.dart';

@GenerateMocks([HomePageRemoteDataSourceBase])
void main() {
  late HomePageRemoteDataSourceBase remoteMock;
  late HomePageRepositoryBase repository;

  setUpAll(() {
    remoteMock = MockHomePageRemoteDataSourceBase();
    repository = HomePageRepository(remote: remoteMock);
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
        voteCount: 1),
  ];
  group('HomeRepository', () {
    group('getMoviesPopular', () {
      test('should return right', () async {
        when(remoteMock.getMoviesPopular(NoParams()))
            .thenAnswer((_) async => movies);

        final result = await repository.getMoviesPopular(NoParams());

        expect(result.isRight(), false);
      });
      test('should return left with UnhandledFailure', () async {
        when(remoteMock.getMoviesPopular(NoParams()))
            .thenThrow(Exception('Network error'));

        final result = await repository.getMoviesPopular(NoParams());

        expect(result.isLeft(), true);
        expect(
          result.fold(
            (failure) => failure,
            (_) => null,
          ),
          isA<UnhandledFailure>(),
        );
      });
    });
  });
}
