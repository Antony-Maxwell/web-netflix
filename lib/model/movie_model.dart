class MovieModel {
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final double rating;

  MovieModel({
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.rating,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'] ?? '',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      overview: json['overview'] ?? '',
      rating: (json['vote_average'] ?? 0).toDouble(),
    );
  }
}
