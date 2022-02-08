import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter good good',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Scaffold(
        body: Counter(title: 'title..'),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  PreferredSizeWidget _buildAppBar(String title) {
    return AppBar(
      title: Text(title),
    );
  }

  Widget _buildBody(
      {required int counter,
      required VoidCallback callback,
      required BuildContext context}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          ElevatedButton(
            onPressed: () {
              callback();
              if (counter == 41) {
                const snackBar = SnackBar(
                    content:
                        Text('answer to life the universe and everything'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: const Text(
              'Add',
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _counter = 41;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar('Sateless? or Stateful?'),
      body: _buildBody(
        counter: _counter,
        callback: _incrementCounter,
        context: context,
      ),
    );
  }
}
