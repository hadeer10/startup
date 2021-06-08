class Post1Model {
  int id;
  String title;
  String content;
  String image;
  bool featured;
  String created_at;
  Post1Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    featured = json['featured'];
    created_at = json['created_at'];
  }
}
