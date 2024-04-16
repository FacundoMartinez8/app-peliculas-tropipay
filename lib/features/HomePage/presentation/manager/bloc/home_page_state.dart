part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}

class OnLoading extends HomePageState {}

class OnMoviesPopularFailure extends HomePageState {
  final Failure failure;

  OnMoviesPopularFailure({required this.failure});
}

class OnMoviesPopular extends HomePageState {
  final List<Movie> moviesPopular;

  OnMoviesPopular({required this.moviesPopular});
}

class OnMoviesByNameFailure extends HomePageState {
  final Failure failure;

  OnMoviesByNameFailure({required this.failure});
}

class OnMoviesByName extends HomePageState {
  final List<Movie> moviesByName;

  OnMoviesByName({required this.moviesByName});
}

class OnMoviesFavorite extends HomePageState {
  OnMoviesFavorite();
}
