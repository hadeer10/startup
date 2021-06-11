import 'package:flutter_auth/models/user_model.dart';

abstract class UserProfileStates {}

class UserProfileInitialiteState extends UserProfileStates {}

// to create post part 1
class UserProfileGetProfileDataLoadingState extends UserProfileStates {}

class UserProfileGetProfileDataSuccessState extends UserProfileStates {
  final UserModel userModel;

  UserProfileGetProfileDataSuccessState(this.userModel);
}

class UserProfileGetProfileDataErrorState extends UserProfileStates {
  final String error;

  UserProfileGetProfileDataErrorState(this.error);
}

class UserEditProfileImagePickedSuccessState extends UserProfileStates {}

class UserEditProfileImagePickedErrorState extends UserProfileStates {}

class UserProfileUpdataProfileDataSuccessState extends UserProfileStates {
  final UserModel userModel;
  UserProfileUpdataProfileDataSuccessState(this.userModel);
}

class UserProfileUpdateProfileDataErrorState extends UserProfileStates {
  final String error;
  UserProfileUpdateProfileDataErrorState(this.error);
}
