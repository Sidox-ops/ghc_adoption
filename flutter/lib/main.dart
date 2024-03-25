import 'package:flutter/material.dart';
import 'package:ghc_adoption/data/movie.dart';
import 'package:ghc_adoption/pages/details.dart';
import 'package:ghc_adoption/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'GHC: Flutter Movie List'),
        routes: {
          '/details': (context) => Details(
              movie: ModalRoute.of(context)!.settings.arguments as Movie),
        });
  }
}
