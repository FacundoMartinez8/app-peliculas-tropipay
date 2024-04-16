import 'package:app_peliculas/core/failure/failure.dart';
import 'package:app_peliculas/features/HomePage/data/models/movie_model.dart';
import 'package:app_peliculas/features/HomePage/domain/repository/home_page_repository_base.dart';
import 'package:app_peliculas/features/HomePage/domain/use_case/get_movie_by_name.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_movie_by_name_use_case_test.mocks.dart';

@GenerateMocks([HomePageRepositoryBase])
void main() {
  late GetMovieByNameUseCase useCase;
  late HomePageRepositoryBase mockRepository;

  setUp(() {
    mockRepository = MockHomePageRepositoryBase();
    useCase = GetMovieByNameUseCase(repository: mockRepository);
  });

  group('GetMovieByNameUseCase', () {
    test(
      'should return a list of movies from the repository',
      () async {
        // Arrange
        const movieName = 'Avengers';
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

        when(mockRepository.getMoviesByName(name: movieName))
            .thenAnswer((_) async => Right(movies));

        // Act
        final result = await useCase.call(movieName);

        // Assert
        expect(result, Right(movies));
        verify(mockRepository.getMoviesByName(name: movieName)).called(1);
      },
    );

    test(
      'should return a failure if the repository fails',
      () async {
        // Arrange
        const movieName = 'Avengers';
        final failure = UnhandledFailure(message: 'Error');

        when(mockRepository.getMoviesByName(name: movieName))
            .thenAnswer((_) async => Left(failure));

        // Act
        final result = await useCase.call(movieName);

        // Assert
        expect(result, Left(failure));
        verify(mockRepository.getMoviesByName(name: movieName)).called(1);
      },
    );
  });
}
