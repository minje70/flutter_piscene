class CommentData {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const CommentData(
      {required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body});
}

class CommentDataModel {
  final List<CommentData> list;

  const CommentDataModel({required this.list});

  factory CommentDataModel.fromJson(List<dynamic> json) {
    return CommentDataModel(
      list: json.map((e) {
        return CommentData(
            postId: e['postId'],
            id: e['id'],
            name: e['name'],
            email: e['email'],
            body: e['body']);
      }).toList(),
    );
  }
}
