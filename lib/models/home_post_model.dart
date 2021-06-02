class HomePostsModel {
  List<HomePostsItemModel> data = [];
  HomePostsModel.fromJson(List json) {
    json.forEach((element) {
      data.add(HomePostsItemModel.fromJson(element));
    });
  }
}

class HomePostsItemModel {
  int id;
  String title;
  String content;
  String excerpt;
  String slug;
  bool featured;
  String created_at;
  int user;
  List<dynamic> likes;
  HomePostsItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    excerpt = json['excerpt'];
    slug=json['slug'];
    featured=json['featured'];
    created_at = json['created_at'];
    user=json['user'];
    likes = json['likes'];
  }
}