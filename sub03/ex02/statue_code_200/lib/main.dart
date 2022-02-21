import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    super.initState();
    final uri = Uri(
        scheme: 'https', host: 'jsonplaceholder.typicode.com', path: 'users');
    get(uri).then((value) {
      print(value.body);
      print(value.statusCode);
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(child: Text('hello')),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Test(),
    ),
  ));
}
