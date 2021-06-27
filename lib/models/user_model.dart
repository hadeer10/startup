class UserModel {
  int id;
  String full_name;
  String about;
  String avatar;
  int user;
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    full_name = json['full_name'];
    about = json['about'];
    avatar = json['avatar'];
    user = json['user'];
  }
}
