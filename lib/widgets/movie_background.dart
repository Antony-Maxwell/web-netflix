import 'package:flutter/material.dart';
import 'package:web_netflix/model/movie_model.dart';

class BackgroundCard extends StatelessWidget {
  final MovieModel movie;
  const BackgroundCard({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.backdropPath}'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          movie.title,
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}



class Categorys extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;

  const Categorys({required this.title, required this.movies, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network('https://image.tmdb.org/t/p/w200${movie.posterPath}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
