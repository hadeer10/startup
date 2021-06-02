import 'package:flutter_auth/models/home_post_model.dart';

abstract class HomeStates {}

class HomeInitializeState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
 final HomePostsModel model;

  HomeSuccessState(this.model);

}

class HomeErrorState extends HomeStates {
  final String error;

  HomeErrorState(this.error);
}