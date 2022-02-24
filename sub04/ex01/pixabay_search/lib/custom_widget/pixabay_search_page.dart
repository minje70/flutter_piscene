import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import '../models/pixabay_preview_model.dart';

Future<PictureDataModel> _fetchPicture(String keyword) async {
  final uri =
      Uri(scheme: 'https', host: 'pixabay.com', path: 'api/', queryParameters: {
    'q': keyword,
    'key': dotenv.get('PIXABAY_KEY'),
    'per_page': '60',
  });
  final response = await get(uri);
  return PictureDataModel.fromJson(json.decode(response.body)['hits']);
}

class PixabaySearchPage extends StatefulWidget {
  PixabaySearchPage({Key? key}) : super(key: key);

  @override
  State<PixabaySearchPage> createState() => _PixabaySearchPageState();
}

class _PixabaySearchPageState extends State<PixabaySearchPage> {
  TextEditingController? _searchController = null;
  TextEditingController? _filterController = null;
  String? _searchErrorMsg = null;
  String _filterKeyword = '';
  Future<PictureDataModel>? model = null;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filterController = TextEditingController();
    _filterKeyword = '';
    model = _fetchPicture('');
  }

  @override
  void dispose() {
    _searchController!.dispose();
    _filterController!.dispose();
    super.dispose();
  }

  Widget _resultImageGrid() {
    return FutureBuilder(
      future: model,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final result = snapshot.data as PictureDataModel;
            return Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: result.list.where((element) {
                  if (_filterKeyword == '')
                    return true;
                  else
                    return element.tags.contains(_filterController!.value.text);
                }).map((e) {
                  return Column(
                    children: [
                      Expanded(
                        child: Image(
                          image: Image.network(e.previewURL).image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(e.tags),
                    ],
                  );
                }).toList(),
              ),
            );
          } else {
            return Text('no data...');
          }
        } else {
          return Text('error...');
        }
      },
    );
  }

  Widget _searchBar() {
    return Container(
      child: TextFormField(
        controller: _searchController,
        style: TextStyle(
          color: Color.fromARGB(255, 194, 194, 194),
        ),
        decoration: InputDecoration(
          errorText: _searchErrorMsg,
          prefixIcon: Icon(
            Icons.photo,
            color: Color.fromARGB(255, 194, 194, 194),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              if (_searchController!.value.text.isEmpty) {
                setState(() {
                  _searchErrorMsg = '키워드를 입력하세요.';
                });
              } else {
                setState(() {
                  _searchErrorMsg = null;
                });
                model = _fetchPicture(_searchController!.value.text);
              }
            },
            child: Icon(
              Icons.search,
              color: Color.fromARGB(255, 194, 194, 194),
            ),
          ),
          hintText: 'Search : Car, Tree, Space, ETC...',
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 194, 194, 194),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 194, 194, 194),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 194, 194, 194),
            ),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
      ),
    );
  }

  Widget _filterBar() {
    return Container(
      child: TextFormField(
        onChanged: (value) => setState(() {
          _filterKeyword = value;
        }),
        controller: _filterController,
        style: TextStyle(
          color: Color.fromARGB(255, 194, 194, 194),
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.filter,
            color: Color.fromARGB(255, 194, 194, 194),
          ),
          hintText: 'Filter : ',
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 194, 194, 194),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 194, 194, 194),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 194, 194, 194),
            ),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _searchBar(),
          SizedBox(height: 10),
          _filterBar(),
          SizedBox(height: 20),
          _resultImageGrid(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pixabay Search'),
        centerTitle: false,
      ),
      body: _body(),
    );
  }
}
