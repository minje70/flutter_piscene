import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:json2dart/custom_widget/details_page.dart';
import '../model/conference_data_model.dart';
import 'dart:convert';

Future<ConferenceDataModels> fetchConferenceDataModels() async {
  // https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json
  final uri = Uri.parse(
      'https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json');
  final response = await get(uri);
  if (response.statusCode == 200) {
    final tmp = ConferenceDataModels.fromJson(json.decode(response.body));
    return tmp;
  } else {
    throw Exception('Failed to load post');
  }
}

class ConferencePage extends StatefulWidget {
  ConferencePage({Key? key}) : super(key: key);

  @override
  State<ConferencePage> createState() => _ConferencePageState();
}

class _ConferencePageState extends State<ConferencePage> {
  Future<ConferenceDataModels>? conferencDataModels;

  @override
  void initState() {
    super.initState();
    conferencDataModels = fetchConferenceDataModels();
  }

  Widget _conferenceList(ConferenceDataModels data) {
    return ListView.separated(
      padding: EdgeInsets.all(12),
      itemCount: data.list.length,
      itemBuilder: (BuildContext context, int index) {
        final element = data.list[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          title: Text(
            element.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          subtitle: Text(element.location),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                        name: element.name,
                        location: element.location,
                        start: element.start,
                        end: element.end,
                        link: element.link)));
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          thickness: 1,
        );
      },
    );
  }

  Widget _body() {
    return Center(
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _conferenceList(snapshot.data as ConferenceDataModels);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else
            return (Text('Error!!'));
        },
        future: conferencDataModels,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conference'),
        centerTitle: false,
      ),
      body: _body(),
    );
  }
}
