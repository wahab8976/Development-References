
class PostModel {
  final String title;
  final String body;
  final int id;

  PostModel({
    required this.body,
    required this.title,
    required this.id,
  });

  factory PostModel.fromJSON(Map<String, dynamic> json){
    return PostModel(
        body: json['body'],
        title:  json['title'],
        id: int.tryParse(json['id'].toString()) ?? 0
    );
  }
}