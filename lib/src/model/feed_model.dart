class FeedModel {
  int? id;
  String? name;
  int? imageId;
  String? content;
  DateTime? createdAt;

  FeedModel.parse(Map m) {
    id = m['id'];
    content = m['content'];
    createdAt = DateTime.parse(m['created_at']);
    name = m['name'];
    imageId = m['image_id'];
  }
}
