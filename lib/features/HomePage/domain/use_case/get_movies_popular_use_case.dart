import 'package:app_peliculas/core/failure/failure.dart';
import 'package:app_peliculas/core/use_case/no_params.dart';
import 'package:app_peliculas/core/utils/use_case_base.dart';
import 'package:app_peliculas/features/HomePage/domain/entity/movie.dart';
import 'package:app_peliculas/features/HomePage/domain/repository/home_page_repository_base.dart';
import 'package:dartz/dartz.dart';

class GetMoviesPopularUseCase extends UseCaseBase<List<Movie>, NoParams> {
  final HomePageRepositoryBase homeRepository;

  GetMoviesPopularUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) {
    return homeRepository.getMoviesPopular(params);
  }
}
