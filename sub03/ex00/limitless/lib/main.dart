import 'package:flutter/material.dart';
import 'custom_widget/movie_page.dart';

void main() {
  runApp(MaterialApp(
    home: MoviePage(),
    theme: ThemeData(primarySwatch: Colors.green),
  ));
}
