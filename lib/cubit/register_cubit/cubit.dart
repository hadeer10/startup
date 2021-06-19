import 'package:flutter/material.dart';
import 'package:flutter_auth/cubit/register_cubit/states.dart';
import 'package:flutter_auth/models/register_model.dart';
import 'package:flutter_auth/network/end_points.dart';
import 'package:flutter_auth/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialiteState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterModel registerModel;

  void userRegister({
    @required String user_name,
    @required String email,
    @required String password,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: REGISTER, data: {
      'email': email,
      'user_name': user_name,
      'password': password
    }).then((value) {
      if (value.statusCode == 200 || value.statusCode == 201) {
        registerModel = RegisterModel.fromJson(value.data);
        print(registerModel.email);
        emit(RegisterSuccessState());
      } else {
        String error=value.data;
         print(error);
         emit(RegisterErrorState(error.toString()));
      }
    }).catchError((error) {
     // print(error.toString());

      emit(RegisterErrorState(error.message.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePassWordVisibilaty() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }
}
