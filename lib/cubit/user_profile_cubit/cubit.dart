import 'dart:io';

import 'package:flutter_auth/cubit/user_profile_cubit/states.dart';
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

  void updateUserData(String fullName, String bio, String pickedImage) {
    DioHelper.putData(
            url: '$GETUSERPROFILE$uId/',
            token: 'JWT $accessToken',
            data: {'first_name': fullName, 'about': bio, 'avatar': pickedImage})
        .then((value) {
      print('user updated successfully and data is ${value.data}');
      userModel = UserModel.fromJson(value.data);
      emit(UserProfileUpdataProfileDataSuccessState(userModel));
    }).catchError((error) {
      print('error is ${error.message}');

      emit(UserProfileUpdateProfileDataErrorState(error.toString()));
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
