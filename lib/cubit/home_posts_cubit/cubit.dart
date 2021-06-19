import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/cubit/home_posts_cubit/states.dart';
import 'package:flutter_auth/models/favourite_model.dart';
import 'package:flutter_auth/models/home_post_model.dart';
import 'package:flutter_auth/network/end_points.dart';
import 'package:flutter_auth/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitializeState());
  static HomeCubit get(context) => BlocProvider.of(context);
  Map<int, bool> userLikedList = {};
  HomePostsModel model;
  void getPosts() {
    emit(HomeLoadingState());
    DioHelper.getData(url: HOMEPOSTSLIST, token: 'JWT $accessToken')
        .then((value) {
      print('home data is ${value.data}');
      model = HomePostsModel.fromJson(value.data);
      model.data.forEach((elementFirst) {
        elementFirst.likes.forEach((element) {
          if (element.id == uId) {
            userLikedList.addAll({elementFirst.id: true});
          }
        });
      });

      emit(HomeSuccessState(model));
    }).catchError((error) {
      print('error is ${error}');

      emit(HomeErrorState(error.toString()));
    });
  }

  FavouriteModel favouriteModel;

  bool getFavPost(int postId) {
    return userLikedList[postId] ?? false;
  }

  
  void changePostFavourite(int postId) {
    DioHelper.getData(url: '$POSTLIKE$postId/', token: 'JWT $accessToken')
        .then((value) {
      favouriteModel = FavouriteModel.formJson(value.data);

      userLikedList[postId] = favouriteModel.liked;
     
        
      emit(ChangeFavouritePostColorSuccessState());
    }).catchError((error) {
      print('post change post fav error is :${error}');
      emit(ChangeFavouritePostColorErrorState());
    });
  }
}
