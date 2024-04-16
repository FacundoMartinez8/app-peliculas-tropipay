import 'package:app_peliculas/core/failure/failure.dart';
import 'package:app_peliculas/core/use_case/no_params.dart';
import 'package:app_peliculas/features/HomePage/data/data_sources/home_page_remote_data_source.dart';
import 'package:app_peliculas/features/HomePage/domain/entity/movie.dart';
import 'package:dartz/dartz.dart';

abstract class HomePageRepositoryBase {
  final HomePageRemoteDataSourceBase remote;

  HomePageRepositoryBase({required this.remote});

  Future<Either<Failure, List<Movie>>> getMoviesPopular(NoParams noParams);

  Future<Either<Failure, List<Movie>>> getMoviesByName({required String name});
}
