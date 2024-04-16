import 'package:animate_do/animate_do.dart';
import 'package:app_peliculas/core/services/dependencies_injection_service.dart';
import 'package:app_peliculas/core/services/preferences_services.dart';
import 'package:app_peliculas/features/HomePage/domain/entity/movie.dart';
import 'package:app_peliculas/features/HomePage/presentation/manager/bloc/home_page_bloc.dart';
import 'package:app_peliculas/features/HomePage/presentation/widgets/movie_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MoviesPopularWidget extends StatefulWidget {
  final List<Movie> moviesPopular;
  const MoviesPopularWidget({super.key, required this.moviesPopular});

  @override
  State<MoviesPopularWidget> createState() => _MoviesPopularWidgetState();
}

class _MoviesPopularWidgetState extends State<MoviesPopularWidget> {
  final local = getIt<PreferencesServicesBase>();

  final homePageBloc = getIt<HomePageBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      bloc: homePageBloc,
      listener: (context, state) {
        if (state is OnMoviesByName) {
          setState(() {});
        }
      },
      builder: (context, state) {
        return AnimationLimiter(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              widget.moviesPopular.length,
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
                          movie: widget.moviesPopular[index],
                        ),
                      ),
                    ));
              },
            ),
          ),
        );
      },
    );
  }
}
