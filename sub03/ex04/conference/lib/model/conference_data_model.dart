import 'package:flutter/material.dart';

class ConferenceDataModel {
  final String name;
  final String link;
  final String start;
  final String end;
  final String location;

  const ConferenceDataModel({
    required this.name,
    required this.link,
    required this.start,
    required this.end,
    required this.location,
  });
}

class ConferenceDataModels {
  final List<ConferenceDataModel> list;

  const ConferenceDataModels({required this.list});

  factory ConferenceDataModels.fromJson(List<dynamic> json) {
    final tmp = ConferenceDataModels(
      list: json.map((element) {
        return ConferenceDataModel(
            name: element['name'],
            link: element['link'],
            start: element['start'],
            end: element['end'],
            location: element['location']);
      }).toList(),
    );
    return tmp;
  }
}
