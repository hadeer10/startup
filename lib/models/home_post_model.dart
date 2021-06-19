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
  List<LikesUsers> likes = [];
  List<dynamic> comments;
  String title;
  String content;
  String image;
  String created_at;
  HomePostsItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    total_likes = json['total_likes'];
    json['likes'].forEach((element) {
      likes.add(LikesUsers.fromJson(element));
    });

    comments = json['comments'];
    image = json['image'];
    created_at = json['created_at'];
    user = User.fromJson(json['user']);
    dataset = DataSet.fromJson(json['dataset']);
  }
}

class LikesUsers {
  int id;
  String email;
  String user_name;
  LikesUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    user_name = json['user_name'];
  }
}

class User {
  int id;
  String full_name;
  String mobile;
  String age;
  String job;
  String country;
  String about;
  String avatar;
  int user;
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    full_name = json['full_name'] == '' ? 'full_name' : json['full_name'];
    mobile = json['mobile'] ?? 'mobile';
    age = json['age'] ?? 'age';
    job = json['job'] ?? 'job';
    country = json['country'] ?? 'country';
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
