import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListData {
  const ListData(
      {this.isFavorite = false,
      required this.subTitle,
      required this.title,
      required this.id});

  final int id;
  final String title;
  final String subTitle;
  final bool isFavorite;
}

class InfiniteWidget extends StatefulWidget {
  const InfiniteWidget({Key? key}) : super(key: key);
  @override
  State<InfiniteWidget> createState() => InfiniteState();
}

class InfiniteState extends State<InfiniteWidget> {
  final Random rdc = Random();
  final List<ListData> data = [];
  int lastId = 0;

  @override
  void initState() {
    lastId = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ex02'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            if (index >= data.length) {
              print('index : $index');
              for (int i = 0; i < 10; i++) {
                data.add(ListData(
                  subTitle: rdc.nextInt(100) % 2 == 0 ? 'done' : 'not yet',
                  title: WordPair.random().asPascalCase,
                  id: lastId++,
                ));
              }
            }
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Dismissible(
                key: ValueKey<int>(data[index].id),
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.red,
                  child: Text(
                    'remove',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                secondaryBackground: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.red,
                  child: Text(
                    'remove',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  alignment: Alignment.centerRight,
                ),
                child: ListTile(
                  title: Text(data[index].title),
                  subtitle: Text(data[index].subTitle),
                  trailing: IconButton(
                    icon: data[index].isFavorite
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(Icons.favorite_border),
                    onPressed: () {
                      setState(
                        () {
                          data[index] = ListData(
                            id: data[index].id,
                            subTitle: data[index].subTitle,
                            title: data[index].title,
                            isFavorite: !data[index].isFavorite,
                          );
                        },
                      );
                    },
                  ),
                ),
                onDismissed: (DismissDirection _) {
                  setState(() {
                    data.removeAt(index);
                  });
                  print('삭제..');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(InfiniteWidget());
}
