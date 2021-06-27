import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/cubit/home_posts_cubit/cubit.dart';
import 'package:flutter_auth/cubit/home_posts_cubit/states.dart';
import 'package:flutter_auth/models/home_post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Comments extends StatelessWidget {
  List<Comment> listOfComments;
  Comments(this.listOfComments);
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              child: CommentBox(
                userImage:
                    "https://image.shutterstock.com/image-photo/closeup-photo-amazing-short-hairdo-260nw-1617540484.jpg",
                child: ListView.separated(
                    itemBuilder: (context, i) => Padding(
                          padding:
                              const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
                          child: ListTile(
                            leading: GestureDetector(
                              onTap: () async {
                                // Display the image in large form.
                                print("Comment Clicked");
                              },
                              child: Container(
                                height: 50.0,
                                width: 50.0,
                                decoration: new BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(50))),
                                child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        'https://image.shutterstock.com/image-photo/closeup-photo-amazing-short-hairdo-260nw-1617540484.jpg')),
                              ),
                            ),
                            title: Text(
                              listOfComments[i].owner.user_name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(listOfComments[i].body),
                          ),
                        ),
                    separatorBuilder: (context, i) => Container(
                          color: Colors.grey[200],
                          height: 1,
                        ),
                    itemCount: listOfComments.length),
                labelText: 'Write a comment...',
                errorText: 'Comment cannot be blank',
                sendButtonMethod: () {
                  if (formKey.currentState.validate()) {
                    print(commentController.text);
                    HomeCubit.get(context).addComment(
                        commentController.text, listOfComments[0].post);

                    commentController.clear();
                    FocusScope.of(context).unfocus();
                  } else {
                    print("Not validated");
                  }
                },
                formKey: formKey,
                commentController: commentController,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                sendWidget: Icon(Icons.send_sharp,
                    size: 30, color: Colors.purpleAccent),
              ),
            ),
          );
        },
        listener: (context, state) {
          if(state is HomeAddCommentSuccessState){
            print('commnet added successfully ');
            listOfComments.add(state.comment);
          }
        });
  }
}
