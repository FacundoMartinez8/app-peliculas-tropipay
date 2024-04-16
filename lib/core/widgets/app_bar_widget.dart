import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:app_peliculas/core/services/dependencies_injection_service.dart';
import 'package:app_peliculas/core/use_case/no_params.dart';
import 'package:app_peliculas/features/HomePage/presentation/manager/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final int index;
  final double appBarHeight;

  AppBarWidget({
    super.key,
    required this.appBarHeight,
    required this.index,
  });

  final homePageBloc = getIt<HomePageBloc>();

  static String getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return 'Películas';
      case 1:
        return 'Series';
      case 2:
        return 'Favoritos';
      default:
        return '';
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  final TextEditingController textController = TextEditingController();

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
      },
      builder: (context, state) {
        return AppBar(
          title: GestureDetector(
            onTap: () {
              homePageBloc.add(GetPopularMovieEvent(noParams: NoParams()));
            },
            child: Text(getTitleForIndex(index),
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5, right: 5),
              child: AnimSearchBar(
                width: 250,
                textController: textController,
                onSuffixTap: () {
                  homePageBloc
                      .add(GetMovieByNameEvent(name: textController.text));
                },
                onSubmitted: (s) {},
                suffixIcon: const Icon(
                  Icons.search_outlined,
                  color: Colors.black87,
                ),
              ),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.black87,
        );
      },
    );
  }
}
