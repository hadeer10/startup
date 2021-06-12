import 'package:flutter_auth/models/home_post_model.dart';
import 'package:flutter_auth/models/user_model.dart';

abstract class UserProfileStates {}

class UserProfileInitialiteState extends UserProfileStates {}

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

class UserProfileGetProfilePostsLoadingState extends UserProfileStates {}

class UserProfileGetProfilePostsSuccessState extends UserProfileStates {
  final HomePostsModel model;

  UserProfileGetProfilePostsSuccessState(this.model);
}

class UserProfileGetProfilePostsErrorState extends UserProfileStates {
  final String error;

  UserProfileGetProfilePostsErrorState(this.error);
}

class UserProfileDeletePostLoadingState extends UserProfileStates {}

class UserProfileDeletePostPostsSuccessState extends UserProfileStates {
 final HomePostsItemModel item;

  UserProfileDeletePostPostsSuccessState(this.item);

}

class UserProfileDeletePostPostsErrorState extends UserProfileStates {
 final String error;

  UserProfileDeletePostPostsErrorState(this.error);
}
