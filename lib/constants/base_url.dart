import 'package:web_netflix/services/api_key.dart';

const kBaseUrl="https://api.themoviedb.org/3";

class ApiEndPoint{
  static const search="$kBaseUrl/search/movie?api_key=$apikey&query=batman&language=en-US&page=1";
}