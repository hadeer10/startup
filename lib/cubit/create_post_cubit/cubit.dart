import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/cubit/create_post_cubit/states.dart';
import 'package:flutter_auth/models/post1_model.dart';
import 'package:flutter_auth/models/post2_model.dart';
import 'package:flutter_auth/network/end_points.dart';
import 'package:flutter_auth/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostCubit extends Cubit<CreatePostStates> {
  CreatePostCubit() : super(CreatePostInitialiteState());

  static CreatePostCubit get(context) => BlocProvider.of(context);
  // to create post part 1
  Post1Model post1model;
  void createPost1({@required String title, @required String content}) {
    emit(CreatePostPart1LoadingState());
    DioHelper.postData(
        url: CREATEPOST,
        token: 'JWT $accessToken',
        data: {'title': title, 'content': content}).then((value) {
      post1model = Post1Model.fromJson(value.data);
      emit(CreatePostPart1SuccessState(post1model));
    }).catchError((error) {
      emit(CreatePostPart1ErrorState(error.message.toString()));
    });
  }

  // to create post part 2
  Post2Model post2model;
  void createPost2({
    @required int funding_total_usd,
    @required String country_code,
    @required int funding_rounds,
    @required String category_list,
    @required int id,
  }) {
    emit(CreatePostPart2LoadingState());
    DioHelper.postData(
        url: '$CREATEPOST$id/',
        token: 'JWT $accessToken',
        data: {
          'funding_total_usd': funding_total_usd,
          'country_code': country_code,
          'funding_rounds': funding_rounds,
          'category_list': category_list,
        }).then((value) {
      post2model = Post2Model.fromJson(value.data);
      emit(CreatePostPart2SuccessState(post2model));
    }).catchError((error) {
      emit(CreatePostPart2ErrorState(error.message.toString()));
    });
  }

  String selectedValue;
  void changeSelectedMenuItem(String value) {
    selectedValue = value;
    print(selectedValue);
    emit(SelectMenuItemsucsessState());
  }
}
