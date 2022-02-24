import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hello fire-base',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('myData');
  TextEditingController? _nameController = null;
  TextEditingController? _ageController = null;
  Future<QuerySnapshot<Object?>>? _data = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = users.get();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController!.dispose();
    _ageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(hintText: '이름'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: '나이'),
            ),
            ElevatedButton(
                onPressed: () {
                  if (!_nameController!.value.text.isEmpty &&
                      !_ageController!.value.text.isEmpty) {
                    users
                        .add({
                          'name': _nameController!.value.text,
                          'age': int.parse(_ageController!.value.text)
                        })
                        .then((value) => print('success!!!!!'))
                        .catchError((err) {
                          print(err);
                        });
                  }
                },
                child: Text('올리기')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _data = users.get();
                  });
                },
                child: Text('내리기')),
            Expanded(
              child: FutureBuilder(
                future: _data,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      final result = snapshot.data!.docs;
                      return GridView.count(
                          crossAxisCount: 2,
                          children: result
                              .map((e) => Text(
                                  'name : ${e['name']}, age : ${e['age']}'))
                              .toList());
                      return Text('done');
                    } else {
                      return Text('no data...');
                    }
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    return Text('error...');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
