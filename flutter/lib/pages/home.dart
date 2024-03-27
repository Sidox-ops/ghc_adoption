import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ghc_adoption/data/movie.dart';
import 'package:ghc_adoption/data/movies_provider.dart';
import 'package:ghc_adoption/widget/trending_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Movie>> _moviesFuture;
  final moviesProvider = MoviesProvider();
  final _filterController = TextEditingController();
  String _filter = '';

  @override
  void initState() {
    super.initState();
    _moviesFuture = moviesProvider.loadMovies();
    _filterController.addListener(_onFilterChanged);
  }

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  void _onFilterChanged() {
    setState(() {
      _filter = _filterController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder<List<Movie>>(
                future: _moviesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Erreur: ${snapshot.error}');
                  } else {
                    final movies = snapshot.data!.where((movie) {
                      return movie.title
                          .toLowerCase()
                          .contains(_filter.toLowerCase());
                    }).toList();
                    if (movies.isEmpty) {
                      return const Text(
                          'Aucun film ne correspond à votre recherche.');
                    } else {
                      return TrendingSlider(movies: movies);
                    }
                  }
                },
              ),
            ),
            const SizedBox(height: 64),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                controller: _filterController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Filtrer par titre',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
