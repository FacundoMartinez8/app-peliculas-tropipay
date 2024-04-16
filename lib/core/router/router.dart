import 'package:app_peliculas/features/HomePage/domain/entity/movie.dart';
import 'package:app_peliculas/features/HomePage/presentation/pages/home_page.dart';
import 'package:app_peliculas/features/HomePage/presentation/pages/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, state) => const HomePage(),
    ),
    GoRoute(
        path: '/movie_details',
        builder: (context, state) {
          final movie = state.extra as Movie;
          return MovieDetails(movie: movie);
        }),
  ],
);
