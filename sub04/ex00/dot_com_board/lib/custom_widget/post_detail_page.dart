import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:http/http.dart';
import '../models/comment_data_model.dart';
import 'dart:convert';

Future<CommentDataModel> fetchCommentData() async {
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/comments');
  final response = await get(uri);
  if (response.statusCode == 200) {
    return CommentDataModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Comment Data');
  }
}

class PostDetailPage extends StatefulWidget {
  PostDetailPage(
      {Key? key,
      required this.postId,
      required this.title,
      required this.content})
      : super(key: key);
  final int postId;
  final String title;
  final String content;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  Future<CommentDataModel>? model;

  @override
  void initState() {
    super.initState();
    model = fetchCommentData();
  }

  Widget _mainBody() {
    return Elevation95(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '제 목 : ${widget.title}',
              style: Flutter95.textStyle,
            ),
            SizedBox(height: 12),
            Text('내 용 : ${widget.content}', style: Flutter95.textStyle),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _commentList(CommentDataModel data) {
    final myComment =
        data.list.where((element) => element.postId == widget.postId).toList();
    return ListView.separated(
        itemBuilder: ((context, index) {
          return Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '작성자 : ${myComment[index].name}',
                  style: Flutter95.textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '이메일 : ${myComment[index].email}',
                  style: Flutter95.textStyle,
                ),
                Text(
                  '댓 글 : ${myComment[index].body}',
                  style: Flutter95.textStyle,
                ),
              ],
            ),
          );
        }),
        separatorBuilder: (context, i) => Divider(thickness: 1),
        itemCount: myComment.length);
  }

  Widget _comment() {
    return Elevation95(
      child: Container(
        height: 150,
        child: FutureBuilder(
          future: model,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              final data = snapshot.data as CommentDataModel;
              if (snapshot.hasData) {
                return _commentList(data);
              } else {
                return Text(
                  'no data...',
                  style: Flutter95.textStyle,
                );
              }
            } else {
              return Text(
                'error!!',
                style: Flutter95.textStyle,
              );
            }
          },
        ),
      ),
    );
  }

  Widget _advertise() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 48,
          child: Elevation95(
            child: Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                '▶︎ 전화 접속번호 변경 : 01421 -> 1544-1421',
                style: Flutter95.textStyle,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          height: 48,
          child: Elevation95(
            child: Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                '▶︎ 온라인 상담실 -> http://help.nownuri.net',
                style: Flutter95.textStyle,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Image(
          image: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7_Lpn8U2VVUCEZauDjJcmyYj8EaKBwEwX1A&usqp=CAU')
              .image,
          height: 50,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: '${widget.postId}번째 게시물 입니다.',
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Image(
                height: 50,
                image: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6BrOyqgxFuft0B5AWsOVjowFUuqCgfA_WvQ&usqp=CAU')
                    .image),
            SizedBox(height: 12),
            _mainBody(),
            SizedBox(height: 12),
            _comment(),
            SizedBox(height: 12),
            _advertise(),
          ],
        ),
      ),
    );
  }
}
