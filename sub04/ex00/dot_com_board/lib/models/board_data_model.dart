class BoardDatasModel {
  final List<BoardData> list;

  const BoardDatasModel({required this.list});

  factory BoardDatasModel.fromJson(List<dynamic> json) {
    final result = BoardDatasModel(
        list: json
            .map((e) => BoardData(
                userId: e['userId'],
                id: e['id'],
                title: e['title'],
                body: e['body']))
            .toList());
    return result;
  }
}

class BoardData {
  final int userId;
  final int id;
  final String title;
  final String body;

  const BoardData(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});
}
