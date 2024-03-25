import 'package:flutter/material.dart';
import 'package:ghc_adoption/data/movie.dart';
import 'package:ghc_adoption/data/movies_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MoviesProvider moviesProvider = MoviesProvider();

  Future<List<Movie>> getMovies() async {
    var movies = await moviesProvider.loadMovies();
    print('Loading movies $movies');
    return movies;
  }

  @override
  void initState() {
    super.initState();
    _moviesFuture = getMovies(); // Initialisez le Future ici
  }

  late Future<List<Movie>> _moviesFuture; // Déclaration du Future
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
          child: FutureBuilder<List<Movie>>(
              future: _moviesFuture,
              builder: (context, snapshot) => snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Movie movie = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListTile(
                              title: Text(movie.title,
                                  style: const TextStyle(fontSize: 20.0)),
                              subtitle: Text(movie.director,
                                  style: const TextStyle(fontSize: 18.0)),
                              leading: Image.network(movie.imageUrl),
                              onTap: () => Navigator.pushNamed(
                                  context, '/details',
                                  arguments: movie)),
                        );
                      },
                    )
                  : const CircularProgressIndicator())),
    );
  }
}
