class Movie {
  final String title;
  final String director;
  final int year;
  final List<String> genres;
  final String imageUrl;

  Movie(
      {required this.title,
      required this.director,
      required this.year,
      required this.genres,
      required this.imageUrl});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      director: json['director'],
      year: json['year'],
      genres: List<String>.from(json['genres']),
      imageUrl: json['imageURL'],
    );
  }
}
