import 'dart:io';
import 'package:flutter_auth/cubit/user_profile_cubit/states.dart';
import 'package:flutter_auth/models/home_post_model.dart';
import 'package:flutter_auth/models/user_model.dart';
import 'package:flutter_auth/network/end_points.dart';
import 'package:flutter_auth/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants.dart';

class UserProfileCubit extends Cubit<UserProfileStates> {
  UserProfileCubit() : super(UserProfileInitialiteState());

  static UserProfileCubit get(context) => BlocProvider.of(context);

  UserModel userModel;
  void getUserProfileData() {
    emit(UserProfileGetProfileDataLoadingState());
    DioHelper.getData(url: '$GETUSERPROFILE$uId/', token: 'JWT $accessToken')
        .then((value) {
      print('user data is ${value.data}');

      userModel = UserModel.fromJson(value.data);
      emit(UserProfileGetProfileDataSuccessState(userModel));
    }).catchError((error) {
      print('error is ${error.message}');

      emit(UserProfileGetProfileDataErrorState(error.toString()));
    });
  }

  HomePostsModel userProfilePostsModel;
  void getUserProfilePosts() {
    emit(UserProfileGetProfilePostsLoadingState());
    DioHelper.getData(
            url: '$GETUSERPROFILEPOSTS$uId/', token: 'JWT $accessToken')
        .then((value) {
      print('user posts is ${value.data}');

      userProfilePostsModel = HomePostsModel.fromJson(value.data);
      emit(UserProfileGetProfilePostsSuccessState(userProfilePostsModel));
    }).catchError((error) {
      print('error is ${error.message}');

      emit(UserProfileGetProfilePostsErrorState(error.toString()));
    });
  }

  void updateUserData(String fullName, String bio/*, String pickedImage*/) {
    DioHelper.putData(
            url: '$GETUSERPROFILE$uId/',
            token: 'JWT $accessToken',
            data: {'full_name': fullName, 'about': bio/*, 'avatar': pickedImage*/})
        .then((value) {
      print('user updated successfully and data is ${value.data}');
      userModel = UserModel.fromJson(value.data);
      emit(UserProfileUpdataProfileDataSuccessState(userModel));
    }).catchError((error) {
      print('error is ${error.message}');

      emit(UserProfileUpdateProfileDataErrorState(error.toString()));
    });
  }

  void deleteUserProfilePost(int postId, int index) {
    HomePostsItemModel item = userProfilePostsModel.data[index];
    emit(UserProfileDeletePostLoadingState());
    userProfilePostsModel.data.removeAt(index);
    DioHelper.deleteData(
      url: '$HOMEPOSTSLIST$postId/',
      token: 'JWT $accessToken',
    ).then((value) {
      print('post deleted successfully');
      emit(UserProfileDeletePostPostsSuccessState(item));
    }).catchError((error) {
      print('error is ${error.message}');
      userProfilePostsModel.data.add(item);
      emit(UserProfileDeletePostPostsErrorState(error.toString()));
    });
  }

  File profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    var pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(UserEditProfileImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(UserEditProfileImagePickedErrorState());
    }
  }
}
