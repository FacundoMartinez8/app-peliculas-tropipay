import 'package:app_peliculas/features/HomePage/domain/entity/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.adult,
    required super.backdroPath,
    required super.genreIds,
    required super.id,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'],
      backdroPath: json['backdrop_path'] ?? '',
      genreIds: List<int>.from(json['genre_ids']),
      id: json['id'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdroPath,
      'genre_ids': genreIds,
      'id': id,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
