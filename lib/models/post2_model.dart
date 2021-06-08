class Post2Model {
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
  Post2Model.fromJson(Map<String, dynamic> json) {
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
