import 'package:app_peliculas/core/failure/failure.dart';
import 'package:app_peliculas/core/use_case/no_params.dart';
import 'package:app_peliculas/features/HomePage/data/models/movie_model.dart';
import 'package:app_peliculas/features/HomePage/domain/repository/home_page_repository_base.dart';
import 'package:app_peliculas/features/HomePage/domain/use_case/get_movies_popular_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_movie_popular_use_case_test.mocks.dart';

@GenerateMocks([HomePageRepositoryBase])
void main() {
  late GetMoviesPopularUseCase useCase;
  late MockHomePageRepositoryBase mockRepository;

  setUp(() {
    mockRepository = MockHomePageRepositoryBase();
    useCase = GetMoviesPopularUseCase(homeRepository: mockRepository);
  });

  group('GetMoviesPopularUseCase', () {
    test(
      'should return a list of popular movies from the repository',
      () async {
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

        when(mockRepository.getMoviesPopular(any))
            .thenAnswer((_) async => Right(movies));

        final result = await useCase.call(NoParams());

        expect(result, Right(movies));
        verify(mockRepository.getMoviesPopular(any)).called(1);
      },
    );

    test(
      'should return a failure if the repository fails',
      () async {
        final failure = UnhandledFailure(message: 'Error');

        when(mockRepository.getMoviesPopular(any))
            .thenAnswer((_) async => Left(failure));

        final result = await useCase.call(NoParams());

        expect(result, Left(failure));
        verify(mockRepository.getMoviesPopular(any)).called(1);
      },
    );
  });
}
