import 'package:app_peliculas/core/failure/failure.dart';
import 'package:app_peliculas/core/use_case/no_params.dart';
import 'package:app_peliculas/features/HomePage/domain/entity/movie.dart';
import 'package:app_peliculas/features/HomePage/domain/use_case/get_movie_by_name.dart';
import 'package:app_peliculas/features/HomePage/domain/use_case/get_movies_popular_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetMoviesPopularUseCase getMoviesPopularUseCase;
  final GetMovieByNameUseCase getMovieByNameUseCase;
  List<Movie> moviesFavorite = [];

  HomePageBloc(
      {required this.getMoviesPopularUseCase,
      required this.getMovieByNameUseCase})
      : super(HomePageInitial()) {
    on<GetPopularMovieEvent>(_getMoviesPopular);
    on<GetMovieByNameEvent>(_getMoviesByName);
    on<SetFavorite>(_setFavorite);
  }

  void _getMoviesPopular(
    GetPopularMovieEvent event,
    Emitter<HomePageState> emit,
  ) async {
    emit(OnLoading());
    final result = await getMoviesPopularUseCase(NoParams());
    result.fold(
      (l) => emit(OnMoviesPopularFailure(failure: l)),
      (r) => emit(OnMoviesPopular(moviesPopular: r)),
    );
  }

  void _getMoviesByName(
    GetMovieByNameEvent event,
    Emitter<HomePageState> emit,
  ) async {
    emit(OnLoading());
    final result = await getMovieByNameUseCase(event.name);
    result.fold(
      (l) => emit(OnMoviesByNameFailure(failure: l)),
      (r) => emit(OnMoviesByName(moviesByName: r)),
    );
  }

  void _setFavorite(
    SetFavorite event,
    Emitter<HomePageState> emit,
  ) {
    emit(OnMoviesFavorite());
  }
}
