import 'package:app_peliculas/features/HomePage/data/models/movie_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovieModel', () {
    group('MovieModel.fromJson', () {
      test('expect result success', () {
        Map<String, dynamic> data = {
          "adult": false,
          "backdrop_path": "/wwemzKWzjKYJFfCeiB57q3r4Bcm.png",
          "genre_ids": [12, 28, 878],
          "id": 399566,
          "original_title": "Avengers: Endgame",
          "overview":
              "After the devastating events of Avengers: Infinity War, the universe is in ruins due to the efforts of the Mad Titan, Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos' actions and restore order to the universe once and for all, no matter what consequences may be in store.",
          "popularity": 104.228,
          "poster_path": "/or06FN3Dka5tukK1e9sl16pB3iy.jpg",
          "release_date": "2019-04-24",
          "title": "Avengers: Endgame",
          "video": false,
          "vote_average": 8.3,
          "vote_count": 19603
        };
        final result = MovieModel.fromJson(data);
        expect(result.originalTitle, 'Avengers: Endgame');
        expect(result.video, false);
      });
      test('expect result failure', () {
        Map<String, dynamic> data = {};
        expect(
          () => MovieModel.fromJson(data),
          throwsA(isA<Error>()),
        );
      });
    });
  });
}
