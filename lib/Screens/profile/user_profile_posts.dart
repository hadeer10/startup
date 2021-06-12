import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/cubit/home_posts_cubit/cubit.dart';
import 'package:flutter_auth/cubit/user_profile_cubit/cubit.dart';
import 'package:flutter_auth/cubit/user_profile_cubit/states.dart';
import 'package:flutter_auth/models/home_post_model.dart';
import 'package:flutter_auth/modeproviderr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class UserProfilePosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileCubit, UserProfileStates>(
        builder: (context, state) {
      var model = UserProfileCubit.get(context).userProfilePostsModel;
      return Scaffold(
        appBar: AppBar(),
        body: ConditionalBuilder(
          condition:
              UserProfileCubit.get(context).userProfilePostsModel != null,
          builder: (context) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.0,
                    ),
                    itemBuilder: (context, index) =>
                        buildPostItem(context, model.data[index], index),
                    itemCount: model.data.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
            );
          },
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is UserProfileDeletePostPostsSuccessState) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("post  deleted successfully .")));
      }
      if (state is UserProfileDeletePostPostsErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("some thing wrong , try again !")));
      }
    });
  }

  Widget buildPostItem(context, HomePostsItemModel model, int index) =>
      Dismissible(
        confirmDismiss: (direction) async {
          return await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    "Are You Sure You Want to delete this Post ?",
                    style: TextStyle(color: Colors.black),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          UserProfileCubit.get(context)
                              .deleteUserProfilePost(model.id, index);
                          Navigator.of(context).pop(true);
                          return true;
                        },
                        child: Text('Delete ')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                          return false;
                        },
                        child: Text('cancel ')),
                  ],
                );
              });
        },
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red,
        ),
        key: Key(model.id.toString()),
        child: Card(
          elevation: 10.0,
          color: Provider.of<Myproiderr>(context).backofcard,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        /*   Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PostUserProfile(model.user)));*/
                      },
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                            /*model.user.avatar*/ 'https://image.freepik.com/free-photo/portrait-cheerful-excited-tablet-user-wearing-eyeglasses_1262-18272.jpg'),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(model.user.first_name,
                                style: TextStyle(height: 1.4)),
                            SizedBox(
                              width: 7.0,
                            ),
                          ],
                        ),
                        Text(
                          model.created_at,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(height: 1.4),
                        )
                      ],
                    )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                    height: 1.0,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),
                InkWell(
                  onTap: () {
                    /* Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostDetailsScreen(model)));*/
                  },
                  child: Wrap(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          model.title,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 200.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          image: DecorationImage(
                              image: NetworkImage(
                                  /*model.image*/ 'https://image.freepik.com/free-photo/start-up-business-creative-people_31965-1843.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'category ${model.dataset.category_list}',
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Country ${model.dataset.country_code}',
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              child: Row(
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.favorite_border),
                                      onPressed: () {}),
                                  Text(
                                    model.total_likes.toString(),
                                  )
                                ],
                              ),
                              onTap: () {},
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Score ${model.dataset.score * 100}',
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
