import 'package:flutter/material.dart';
import 'package:ghc_adoption/data/movie.dart';

class Details extends StatefulWidget {
  final Movie movie;

  Details({required this.movie});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Director: ${widget.movie.director}'),
            Text('Year: ${widget.movie.year.toString()}'),
            Text('Genres: ${widget.movie.genres.join(', ')}'),
            Image.network(widget.movie.imageUrl),
          ],
        ),
      ),
    );
  }
}
