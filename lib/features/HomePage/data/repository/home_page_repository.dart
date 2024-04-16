import 'package:app_peliculas/core/failure/failure.dart';
import 'package:app_peliculas/core/use_case/no_params.dart';
import 'package:app_peliculas/features/HomePage/domain/entity/movie.dart';
import 'package:app_peliculas/features/HomePage/domain/repository/home_page_repository_base.dart';
import 'package:dartz/dartz.dart';

class HomePageRepository extends HomePageRepositoryBase {
  HomePageRepository({required super.remote});

  @override
  Future<Either<Failure, List<Movie>>> getMoviesPopular(
      NoParams noParams) async {
    try {
      final response = await remote.getMoviesPopular(noParams);
      return Right(response);
    } catch (e) {
      return Left(
        UnhandledFailure(message: '$e'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMoviesByName(
      {required String name}) async {
    try {
      final response = await remote.getMoviesByName(name: name);
      return Right(response);
    } catch (e) {
      return Left(
        UnhandledFailure(message: '$e'),
      );
    }
  }
}
