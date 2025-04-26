import 'package:flutter/material.dart';
import 'package:web_netflix/model/search_model.dart';
import 'package:web_netflix/model/search_movie_tile.dart';
import 'package:web_netflix/services/search_api.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchService _searchService = SearchService();
  List<SearchMovieModel> _searchResults = [];
  bool _isLoading = false;
  bool _isError = false;

  void _searchMovies(String query) async {
    setState(() {
      _isLoading = true;
      _isError = false;
    });

    try {
      final results = await _searchService.searchMovies(query);

      setState(() {
        _searchResults = results;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isError = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Search Movies',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search for movies...',
                hintStyle: TextStyle(color: Colors.white54),
                fillColor: Colors.grey[800],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.search, color: Colors.white),
              ),
              onSubmitted: _searchMovies,
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _isError
                    ? Center(
                        child: Text(
                          'Something went wrong!',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      )
                    : _searchResults.isEmpty
                        ? Center(
                            child: Text(
                              'No results found.',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _searchResults.length,
                            itemBuilder: (context, index) {
                              final movie = _searchResults[index];
                              return SearchMovieTile(movie: movie);
                            },
                          ),
          ),
        ],
      ),
    );
  }
}
