import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// class InfiniteWidget extends StatefulWidget {
//   const InfiniteWidget({Key? key}) : super(key: key);
//   @override
//   State<InfiniteWidget> createState() => InfiniteState();
// }

class InfiniteList extends StatelessWidget {
  const InfiniteList({Key? key, required this.rdc}) : super(key: key);
  final Random rdc;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ex02'),
        ),
        body: ListView.builder(
          itemBuilder: (_, index) {
            final WordPair wp = WordPair.random();
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(wp.asPascalCase),
                subtitle: Text(rdc.nextInt(100) % 2 == 0 ? 'done' : 'not yet'),
                trailing: IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () => print('click heart'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(InfiniteList(rdc: Random()));
}
