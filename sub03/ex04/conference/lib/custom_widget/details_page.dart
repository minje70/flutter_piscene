import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
      {Key? key,
      required this.name,
      required this.location,
      required this.start,
      required this.end,
      required this.link})
      : super(key: key);

  final String name;
  final String location;
  final String start;
  final String end;
  final String link;

  @override
  Widget build(BuildContext context) {
    final startDate = DateTime.parse(start);
    final endDate = DateTime.parse(end);
    return Scaffold(
      appBar: AppBar(
        title: Text('Conference'),
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(location),
            Text(
                '${DateFormat().add_yMMMMd().format(startDate)} - ${DateFormat().add_yMMMMd().format(endDate)}'),
            TextButton(
              onPressed: () async {
                if (!await launch(link)) throw 'Counld not launch $link';
              },
              child: Text('Go to official website'),
            ),
          ],
        ),
      ),
    );
  }
}
