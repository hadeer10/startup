import 'package:dio/dio.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/cubit/home_posts_cubit/states.dart';
import 'package:flutter_auth/models/home_post_model.dart';
import 'package:flutter_auth/network/end_points.dart';
import 'package:flutter_auth/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitializeState());
  static HomeCubit get(context) => BlocProvider.of(context);
  HomePostsModel model;
  void getPosts() {
    emit(HomeLoadingState());
    DioHelper.getData(url: HOMEPOSTSLIST, token: 'JWT $accessToken')
        .then((value) {
          print('home data is ${value.data}');
      model = HomePostsModel.fromJson(value.data);
      print(model.data[0].created_at);
      print(model.data[0].user.id);
      print(model.data[0].dataset.score);

      emit(HomeSuccessState(model));
    }).catchError((error) {    
        print('error is ${error.message}');
      
      emit(HomeErrorState(error.toString()));
    });
  }
}
