class PostModel {
  int userId;
  int id;
  String title;
  String body;

  PostModel(this.userId, this.id, this.title, this.body);

  factory PostModel.fromMap(Map<String, dynamic> mapData) {
    // print('mapdata');
    // print(mapData);
    return PostModel(
        mapData['userId'], mapData['id'], mapData['title'], mapData['body']);
  }

  @override
  String toString() {
    return '${this.userId} ${this.id} ${this.title} ${this.body}';
  }
}
