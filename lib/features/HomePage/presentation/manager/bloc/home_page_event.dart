part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class GetPopularMovieEvent extends HomePageEvent {
  final NoParams noParams;

  GetPopularMovieEvent({required this.noParams});
}

class GetMovieByNameEvent extends HomePageEvent {
  final String name;

  GetMovieByNameEvent({required this.name});
}
