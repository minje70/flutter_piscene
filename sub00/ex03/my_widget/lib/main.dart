import 'dart:ui';
import 'package:flutter/material.dart';

const squidGameTitleUri =
    'https://w.namu.la/s/420422c9668360c3654fb8d4ba4b4921a22a8732d660e08d81cfa5281035aae6573a4f61927aaeecdcf6ee911af6ea5a4aa49bef54be3f63ada78ac5f914e1cfb4b78e644e2190944fb886f2688ffb91';
const squidGameUri =
    'http://www.mediatoday.co.kr/news/photo/202109/215615_343529_2855.jpg';

class BlurImage extends StatelessWidget {
  const BlurImage({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Stack(
        children: [
          Image.network(imgUrl),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.center,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.0),
                  Colors.black,
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.center,
                end: FractionalOffset.topCenter,
                colors: [
                  Colors.black.withOpacity(0.0),
                  Colors.black,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  const textStyle = TextStyle(color: Colors.white);

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Image.network(squidGameTitleUri),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BlurImage(
              imgUrl: squidGameUri,
            ),
            Text("Title: Squid Game 2020\n", style: textStyle),
            Text("Episode: 1\n", style: textStyle),
            Text(
                "Plot: Seong Gi-hun, a divorced and indebted chauffeur, is invited to play a series of children's games for a chance at a large cash prize. Accepting the offer, he is taken to an\n",
                style: textStyle)
          ],
        ),
      ),
    ),
  );
}
