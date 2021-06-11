class UserModel {
  int id;
  String first_name;
  String about;
  String avatar;
  int user;
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['first_name'];
    about = json['about'];
    avatar = json['avatar'];
    user = json['user'];
  }
}
