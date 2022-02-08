import 'package:flutter/material.dart';
import 'custom_widget/pockemon_details.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      shadowColor: Colors.black.withOpacity(0),
      centerTitle: false,
      backgroundColor: Color.fromARGB(255, 235, 183, 13),
      title: const Text(
        'My Poket',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }

  PoketmonDetails _buildBody() {
    return PoketmonDetails(
        imageURL:
            'https://mblogthumb-phinf.pstatic.net/MjAxNzAyMjVfMjMg/MDAxNDg3OTUzMTI3Mzc0._tG2RA_tY9IZcrw10kWz3YfLkhcuSRxm_rUQoLRhsQEg.hndrmcX4b8HI5c_EJB_JfftjG6C79zJXLQ0g6dZy9FQg.GIF.doghter4our/IMG_3900.GIF?type=w800');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: _buildBody(),
        ),
        backgroundColor: Color.fromARGB(255, 240, 202, 98),
      ),
    );
  }
}

void main() {
  runApp(MyPage());
}
