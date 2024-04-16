import 'package:app_peliculas/core/services/http_service.dart';
import 'package:app_peliculas/core/services/preferences_services.dart';
import 'package:app_peliculas/features/HomePage/data/data_sources/home_page_remote_data_source.dart';
import 'package:app_peliculas/features/HomePage/data/repository/home_page_repository.dart';
import 'package:app_peliculas/features/HomePage/domain/repository/home_page_repository_base.dart';
import 'package:app_peliculas/features/HomePage/domain/use_case/get_movie_by_name.dart';
import 'package:app_peliculas/features/HomePage/domain/use_case/get_movies_popular_use_case.dart';
import 'package:app_peliculas/features/HomePage/presentation/manager/bloc/home_page_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //SERVICES
  getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  getIt.registerSingleton<Client>(Client());
  getIt.registerSingleton<HttpServiceBase>(HttpService(http: getIt()));
  getIt.registerSingleton<PreferencesServicesBase>(
      PreferencesServices(prefs: getIt()));

  //DATA SOURCES
  getIt.registerSingleton<HomePageRemoteDataSourceBase>(
      HomePageRemoteDataSource(http: getIt()));

  //REPOSITORIES
  getIt.registerSingleton<HomePageRepositoryBase>(
      HomePageRepository(remote: getIt()));

  //USE CASES
  getIt.registerSingleton<GetMoviesPopularUseCase>(
      GetMoviesPopularUseCase(homeRepository: getIt()));
  getIt.registerSingleton<GetMovieByNameUseCase>(
      GetMovieByNameUseCase(repository: getIt()));

  //BLOCS
  getIt.registerSingleton<HomePageBloc>(HomePageBloc(
      getMoviesPopularUseCase: getIt(), getMovieByNameUseCase: getIt()));
}
