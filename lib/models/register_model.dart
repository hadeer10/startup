class RegisterModel{
  String email;
  String user_name;
  RegisterModel.fromJson(Map<String,dynamic> json){
    email=json['email'];
    user_name=json['user_name'];
  }
}