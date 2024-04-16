import 'package:animate_do/animate_do.dart';
import 'package:app_peliculas/core/services/dependencies_injection_service.dart';
import 'package:app_peliculas/core/services/preferences_services.dart';
import 'package:app_peliculas/features/HomePage/domain/entity/movie.dart';
import 'package:app_peliculas/features/HomePage/presentation/manager/bloc/home_page_bloc.dart';
import 'package:app_peliculas/features/HomePage/presentation/widgets/movie_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MoviesFavoritesWidgte extends StatefulWidget {
  const MoviesFavoritesWidgte({
    super.key,
  });

  @override
  State<MoviesFavoritesWidgte> createState() => _MoviesFavoritesWidgteState();
}

class _MoviesFavoritesWidgteState extends State<MoviesFavoritesWidgte> {
  final local = getIt<PreferencesServicesBase>();
  final homePageBloc = getIt<HomePageBloc>();

  List<Movie> moviesPopular = [];
  @override
  void initState() {
    super.initState();
    getFavoriteMovies();
  }

  void getFavoriteMovies() async {
    final movies = await local.getMoviesList('movie');
    moviesPopular = movies;
    homePageBloc.moviesFavorite = movies;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    moviesPopular = homePageBloc.moviesFavorite;
    return AnimationLimiter(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          moviesPopular.length,
          (int index) {
            return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 400),
                columnCount: 2,
                child: ScaleAnimation(
                  child: FadeInUp(
                    delay: Duration(milliseconds: 150 * index),
                    duration: const Duration(milliseconds: 800),
                    child: MovieCardWidget(
                      movie: moviesPopular[index],
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
