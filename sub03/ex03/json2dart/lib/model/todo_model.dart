import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Post {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Post(
      {required this.completed,
      required this.title,
      required this.userId,
      required this.id});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

class FetchData extends StatefulWidget {
  FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  Widget fetchedData = Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json2Dart'),
        centerTitle: false,
      ),
      body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              fetchedData,
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)),
                onPressed: () async {
                  // https://jsonplaceholder.typicode.com/todos/1
                  final uri = Uri(
                      scheme: 'https',
                      host: 'jsonplaceholder.typicode.com',
                      path: '/todos/1');
                  final response = await get(uri);
                  if (response.statusCode == 200) {
                    setState(() {
                      final post = Post.fromJson(json.decode(response.body));
                      fetchedData = Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 500,
                            ),
                            Text('title : ${post.title}'),
                            Text('userId : ${post.userId}'),
                            Text('id : ${post.id}'),
                            Text('completed : ${post.title}'),
                          ],
                        ),
                      );
                    });
                  } else {
                    print('error');
                  }
                },
                child: Text('Fetch Data'),
              ),
            ],
          )),
    );
  }
}
