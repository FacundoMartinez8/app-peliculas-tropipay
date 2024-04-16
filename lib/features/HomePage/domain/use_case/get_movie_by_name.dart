import 'package:app_peliculas/core/failure/failure.dart';
import 'package:app_peliculas/core/utils/use_case_base.dart';
import 'package:app_peliculas/features/HomePage/domain/entity/movie.dart';
import 'package:app_peliculas/features/HomePage/domain/repository/home_page_repository_base.dart';
import 'package:dartz/dartz.dart';

class GetMovieByNameUseCase extends UseCaseBase<List<Movie>, String> {
  final HomePageRepositoryBase repository;

  GetMovieByNameUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Movie>>> call(String params) async {
    return await repository.getMoviesByName(name: params);
  }
}
