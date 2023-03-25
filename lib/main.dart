import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/core/services/services_locator.dart';

import 'movies/presentation/screens/movies_screen.dart';

void main() {
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Movies App',
      
      home: MoviesScreen(),
    );
  }
}
