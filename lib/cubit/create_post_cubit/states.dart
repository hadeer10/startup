
import 'package:flutter_auth/models/post1_model.dart';
import 'package:flutter_auth/models/post2_model.dart';

abstract class CreatePostStates {}

class CreatePostInitialiteState extends CreatePostStates {}
// to create post part 1
class CreatePostPart1LoadingState extends CreatePostStates {}

class CreatePostPart1SuccessState extends CreatePostStates {
  final Post1Model post1model;

  CreatePostPart1SuccessState(this.post1model);
}

class CreatePostPart1ErrorState extends CreatePostStates {
  final String error;

  CreatePostPart1ErrorState(this.error);
}
// to create post part 2

class CreatePostPart2LoadingState extends CreatePostStates {}

class CreatePostPart2SuccessState extends CreatePostStates {
  final Post2Model post2model;

  CreatePostPart2SuccessState(this.post2model);
}

class CreatePostPart2ErrorState extends CreatePostStates {
  final String error;

  CreatePostPart2ErrorState(this.error);
}
class SelectMenuItemsucsessState extends CreatePostStates {}

class SelectMenuItemsuErrorState extends CreatePostStates {}
