import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import '../models/board_data_model.dart';
import 'package:http/http.dart';
import './post_detail_page.dart';

Future<BoardDatasModel> fetchBoardDatasModel() async {
  //https://jsonplaceholder.typicode.com/posts
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final response = await get(uri);
  if (response.statusCode == 200) {
    return BoardDatasModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load boardData');
  }
}

class FreeBoardPage extends StatefulWidget {
  FreeBoardPage({Key? key}) : super(key: key);

  @override
  State<FreeBoardPage> createState() => _FreeBoardPageState();
}

class _FreeBoardPageState extends State<FreeBoardPage> {
  Future<BoardDatasModel>? boardDatasModel;

  @override
  void initState() {
    super.initState();
    boardDatasModel = fetchBoardDatasModel();
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Elevation95(
          type: Elevation95Type.down,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                    height: 40,
                    image: Image.network(
                            'https://w.namu.la/s/38ba652856fb56d1d5a883834c3a38738b182255fc003dab113905cdab77e539d1143b1de4c78bad826e1eb5d8828f39514dca3829f277d1d90427777f7fa66eb787ba190896107aa550a29ae50a5843')
                        .image),
                SizedBox(height: 16),
                Elevation95(
                  child: Container(
                    height: 54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '1. 안내/가입',
                          style: Flutter95.textStyle,
                        ),
                        Text(
                          '2. 전자우편',
                          style: Flutter95.textStyle,
                        ),
                        Text(
                          '3. 게시판',
                          style: Flutter95.textStyle,
                        ),
                      ],
                    ),
                  ),
                  type: Elevation95Type.up,
                ),
              ],
            ),
          ),
        ),
        Elevation95(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '번호',
                  style: Flutter95.textStyle,
                ),
                SizedBox(width: 8),
                Text(
                  '제목',
                  style: Flutter95.textStyle,
                ),
              ],
            ),
            padding: EdgeInsets.all(8),
          ),
        ),
        Container(
          height: 300,
          child: Elevation95(
            type: Elevation95Type.down,
            child: FutureBuilder(
              future: boardDatasModel,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    // snapshot.data의 형태를 어떻게 맞춰주지...??
                    final result = snapshot.data as BoardDatasModel;
                    return ListView(
                      itemExtent: 48,
                      children: result.list.map((e) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PostDetailPage(
                                    postId: e.id,
                                    title: e.title,
                                    content: e.body);
                              },
                            ),
                          ),
                          child: Container(
                            height: 30,
                            child: Elevation95(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  '${e.id} : ${e.title}',
                                  style: Flutter95.textStyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  } else {
                    return Text('no data...');
                  }
                } else {
                  return Text('error!!...');
                }
              },
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          height: 64,
          child: Elevation95(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '▶︎ 전화 접속번호 변경 : 01421 -> 1544-1421',
                style: Flutter95.textStyle,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          height: 64,
          child: Elevation95(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '▶︎ 웹 커뮤니티의 최강자! 인/터/넷/나/우/누/리',
                style: Flutter95.textStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Toolbar95 _toolBar() {
    return Toolbar95(
      actions: [
        Item95(
          label: 'File',
          onTap: (BuildContext context) {
            print('File Tap!!');
          },
        ),
        Item95(label: 'Edit'),
        Item95(label: 'Save'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: '나우누리에 오신 것을 환영합니다.',
      body: _body(),
      toolbar: _toolBar(),
    );
  }
}
