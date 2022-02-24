import 'package:flutter/material.dart';
import './custom_widget/pixabay_search_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(
    MaterialApp(
      home: PixabaySearchPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 31, 31, 31),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 73, 73, 73),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
