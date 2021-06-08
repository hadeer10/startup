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
  User user;
  DataSet dataset;
  int total_likes;
  List<dynamic> likes;
  String title;
  String content;
  String image;
  String created_at;
  HomePostsItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    total_likes = json['total_likes'];
    likes = json['likes'];
    image = json['image'];
    created_at = json['created_at'];
    user=User.fromJson(json['user']);
    dataset=DataSet.fromJson(json['dataset']);
  }
}

class User {
  int id;
  String first_name;
  String about;
  String avatar;
  int user;
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['first_name'];
    about = json['about'];
    avatar = json['avatar'];
    user = json['user'];
  }
}

class DataSet {
  int id;
  String category_list;
  String country_code;
  double funding_total_usd;
  int funding_rounds;
  double score;
  double maxfund;
  double minfund;
  bool status;
  int user;
  int post;
  DataSet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category_list = json['category_list'];
    country_code = json['country_code'];
    funding_total_usd = json['funding_total_usd'];
    funding_rounds = json['funding_rounds'];
    score = json['score'];
    maxfund = json['maxfund'];
    minfund = json['minfund'];
    status = json['status'];
    user = json['user'];
    post = json['post'];
  }
}
