class LoginModel {
  int user_id;
  String email;
  String username;
  String access;
  String refresh;
  LoginModel.fromJson(Map<String, dynamic> json) {
    user_id = json['user_id'];
    email = json['email'];
    username = json['username'];
    access = json['access'];
    refresh = json['refresh'];
  }
}
