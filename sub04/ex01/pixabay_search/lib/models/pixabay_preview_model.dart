import 'dart:convert';

class PictureData {
  final String tags;
  final String previewURL;
  final int id;

  const PictureData(
      {required this.tags, required this.previewURL, required this.id});
}

class PictureDataModel {
  final List<PictureData> list;

  const PictureDataModel({required this.list});
  factory PictureDataModel.fromJson(List<dynamic> json) {
    return PictureDataModel(
      list: json
          .map((e) => PictureData(
              tags: e['tags'], previewURL: e['previewURL'], id: e['id']))
          .toList(),
    );
  }
}
