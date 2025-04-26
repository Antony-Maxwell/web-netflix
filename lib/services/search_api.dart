import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_netflix/model/search_model.dart';

class SearchService {
  final String apiKey = 'ea567f6c96a49828aea54b19ae49a4d6';
  final String baseUrl = 'https://api.themoviedb.org/3/search/movie';

  Future<List<SearchMovieModel>> searchMovies(String query) async {
    final url = Uri.parse('$baseUrl?api_key=$apiKey&query=$query&language=en-US');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      final List results = jsonData['results'];

      return results.map((movie) => SearchMovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
