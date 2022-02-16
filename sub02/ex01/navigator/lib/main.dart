import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  Widget _bodyWidget(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('FirstPage'),
        onPressed: () {
          // navigate
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
        centerTitle: false,
      ),
      body: _bodyWidget(context),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  Widget _bodyWidget(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('SecondPage'),
        onPressed: () {
          // navigate
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondRoute(),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
        centerTitle: false,
      ),
      body: _bodyWidget(context),
    );
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.green),
    home: FirstRoute(),
  ));
}
