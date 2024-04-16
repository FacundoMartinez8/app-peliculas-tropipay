import 'package:app_peliculas/core/services/dependencies_injection_service.dart';
import 'package:app_peliculas/core/use_case/no_params.dart';
import 'package:app_peliculas/core/widgets/app_bar_widget.dart';
import 'package:app_peliculas/core/widgets/navigator_bar_widget.dart';
import 'package:app_peliculas/features/HomePage/domain/entity/movie.dart';
import 'package:app_peliculas/features/HomePage/presentation/manager/bloc/home_page_bloc.dart';
import 'package:app_peliculas/features/HomePage/presentation/widgets/movie_favorite_widgets.dart';
import 'package:app_peliculas/features/HomePage/presentation/widgets/movies_popular_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double appBarHeight = 50.0;
  int currentIndex = 0;
  final homePageBloc = getIt<HomePageBloc>();
  List<Movie> moviesPopular = [];
  @override
  void initState() {
    super.initState();
    homePageBloc.add(GetPopularMovieEvent(noParams: NoParams()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      bloc: homePageBloc,
      listener: (context, state) {
        if (state is OnMoviesPopularFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failure.message),
            ),
          );
        }
        if (state is OnMoviesPopular) {
          moviesPopular = state.moviesPopular;
        }
        if (state is OnMoviesByName) {
          moviesPopular = state.moviesByName;
          moviesPopular.isEmpty
              ? ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('No se encontraron resultados'),
                  ),
                )
              : null;
        }
        if (state is OnMoviesByNameFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failure.message),
            ),
          );
        }

        setState(() {});
      },
      builder: (context, state) {
        if (state is OnLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
            backgroundColor: Colors.black87,
            appBar: AppBarWidget(
              appBarHeight: appBarHeight,
              index: currentIndex,
            ),
            body: IndexedStack(
              index: currentIndex,
              children: [
                MoviesPopularWidget(moviesPopular: moviesPopular),
                const Text('Pantalla de Series'),
                const MoviesFavoritesWidgte(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBarWidget(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ));
      },
    );
  }
}
