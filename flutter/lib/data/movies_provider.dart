import 'dart:convert';
import 'package:flutter/services.dart';
import 'movie.dart';

class MoviesProvider {
  Future<List<Movie>> loadMovies() async {
    String jsonString = await rootBundle.loadString('lib/data/movies.json');
    List<dynamic> json = jsonDecode(jsonString);
    return json.map((item) => Movie.fromJson(item)).toList();
  }
}
