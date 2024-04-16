import 'package:app_peliculas/features/HomePage/domain/entity/movie.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;
  static const routeName = '/movie_details';
  const MovieDetails({super.key, required this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
          title: Text(
            widget.movie.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: widget.movie.id,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                fit: BoxFit.cover,
                height: 300,
                width: 400,
                alignment: Alignment.center,
                errorBuilder: (context, error, stackTrace) =>
                    const Text('Error loading image'),
              ),
            ),
            const SizedBox(height: 20),
            Text(widget.movie.title,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text(widget.movie.overview,
                style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
