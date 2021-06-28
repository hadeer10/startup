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

class ChangeFavouritePostColorSuccessState extends HomeStates {}

class ChangeFavouritePostColorErrorState extends HomeStates {}

class HomeAddCommentLoadingState extends HomeStates {}

class HomeAddCommentSuccessState extends HomeStates {
  final Comment comment;

  HomeAddCommentSuccessState(this.comment);
}

class HomeAddCommentErrorState extends HomeStates {
  final String error;

  HomeAddCommentErrorState(this.error);
}

class HomeUserLogoutSuccessState extends HomeStates {}

class HomeUserLogoutErrorState extends HomeStates {
  final String error;

  HomeUserLogoutErrorState(this.error);
}
