import 'package:flutter/material.dart';
import 'package:web_netflix/Screens/movie_details_screen.dart';
import 'package:web_netflix/model/search_model.dart';


class SearchMovieTile extends StatelessWidget {
  final SearchMovieModel movie;

  const SearchMovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final posterUrl = movie.posterPath.isNotEmpty
        ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
        : null;

    return Card(
      color: Colors.grey[900],
      child: ListTile(
        onTap: () {
          // 👇 Navigate to movie details page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(movie: movie),
            ),
          );
        },
        leading: posterUrl != null
            ? Image.network(posterUrl, width: 50, fit: BoxFit.cover)
            : const Icon(Icons.movie, color: Colors.white),
        title: Text(
          movie.title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          movie.overview,
          style: TextStyle(color: Colors.white60),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
