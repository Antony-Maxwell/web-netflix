import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_netflix/model/movie_model.dart';
import 'package:web_netflix/services/api_key.dart';

class MovieService {
  static const String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<MovieModel>> fetchPopularMovies() async {
    final url = Uri.parse('$baseUrl/movie/popular?api_key=$apikey&language=en-US&page=1');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List movies = data['results'];
        print(movies);
        return movies.map((e) => MovieModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load movies. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching movies: $e");
      throw Exception('Failed to load movies');
    }
  }
}
