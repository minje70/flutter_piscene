import 'package:flutter/material.dart';
import 'custom_widget/pockemon_details.dart';

final pika = Poketmon(
  name: 'Pikachu',
  level: 4,
  skill: [
    'Body Blow',
    'Electric Shocks',
    'Electro Ball',
  ],
  imgURL:
      'https://mblogthumb-phinf.pstatic.net/MjAxNzAyMjVfMjMg/MDAxNDg3OTUzMTI3Mzc0._tG2RA_tY9IZcrw10kWz3YfLkhcuSRxm_rUQoLRhsQEg.hndrmcX4b8HI5c_EJB_JfftjG6C79zJXLQ0g6dZy9FQg.GIF.doghter4our/IMG_3900.GIF?type=w800',
  primaryColor: Color.fromARGB(255, 235, 183, 13),
  seconderyColor: Color.fromARGB(255, 240, 202, 98),
);

final isang = Poketmon(
  name: 'Caterpie',
  level: 2,
  skill: [
    'Body Blow',
    'Struggle',
    'BugBite',
  ],
  imgURL:
      'http://file3.instiz.net/data/file3/2018/08/14/d/7/b/d7b25d5d584d77103901068ed3844b9d.gif',
  primaryColor: Color.fromARGB(255, 121, 233, 88),
  seconderyColor: Color.fromARGB(255, 53, 190, 65),
);

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text('mijeong'),
      accountEmail: Text('mijeong@naver.com'),
      currentAccountPicture: CircleAvatar(
        backgroundImage: Image.network(
                'https://esquilo.io/png/thumb/hiZKt04D3Noh5n9-Ash-Ketchum-PNG-Image.png')
            .image,
        backgroundColor: Colors.white,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.red,
            Colors.blue,
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
    );
  }
}

class TrainerDrawer extends StatelessWidget {
  const TrainerDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(),
          ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text('Pocketmon Center'),
          ),
          ListTile(
            leading: Icon(Icons.support_agent),
            title: Text('Support'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _pageIndex = 0;
  Poketmon _poketmon = pika;

  void _setPageIndex(int index) {
    setState(() {
      _pageIndex = index;
      if (index == 0) {
        _poketmon = pika;
      } else {
        _poketmon = isang;
      }
    });
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: _poketmon.primaryColor,
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
          'https://mblogthumb-phinf.pstatic.net/MjAxNzAyMjVfMjMg/MDAxNDg3OTUzMTI3Mzc0._tG2RA_tY9IZcrw10kWz3YfLkhcuSRxm_rUQoLRhsQEg.hndrmcX4b8HI5c_EJB_JfftjG6C79zJXLQ0g6dZy9FQg.GIF.doghter4our/IMG_3900.GIF?type=w800',
      poketmon: _poketmon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: _buildBody(),
        ),
        backgroundColor: _poketmon.seconderyColor,
        drawer: TrainerDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          backgroundColor: _poketmon.primaryColor,
          onTap: (index) => _setPageIndex(index),
          currentIndex: _pageIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'pika',
              icon: Icon(Icons.bolt),
            ),
            BottomNavigationBarItem(
              label: 'isang',
              icon: Icon(
                Icons.grass,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyPage());
}
