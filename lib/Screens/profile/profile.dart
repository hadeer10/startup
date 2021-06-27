import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/home.dart';
import 'package:flutter_auth/Screens/profile/edit.dart';
import 'package:flutter_auth/cubit/user_profile_cubit/cubit.dart';
import 'package:flutter_auth/cubit/user_profile_cubit/states.dart';
import 'package:flutter_auth/models/home_post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../modeproviderr.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  static String id = 'AddStartUpScreen';
  var model;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileCubit, UserProfileStates>(
        builder: (context, state) {
      var model = UserProfileCubit.get(context).userProfilePostsModel;

      // ignore: unused_local_variable
      String fullName = 'no user name';
      String avatar =
          'https://image.freepik.com/free-vector/businessman-avatar-character_24877-57842.jpg';
      // ignore: unused_local_variable
      String bio = 'no user bio';

      return Scaffold(
          appBar: AppBar(
            backgroundColor: Provider.of<Myproiderr>(context).appbarcolor,
            title: Text(
              'Profile',
              style: TextStyle(
                color: Provider.of<Myproiderr>(context).white,
              ),
            ),
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.arrow_back),
                color: kPrimaryColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ConditionalBuilder(
                  condition: UserProfileCubit.get(context).userModel != null,
                  builder: (context) => Column(
                    children: [
                      Container(
                        height: 220.0,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 180.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.freepik.com/free-photo/grungy-white-background-natural-cement-stone-old-texture-as-retro-wall-grunge-material-construction_1258-52295.jpg'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 64,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: NetworkImage(avatar),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '${UserProfileCubit.get(context).userModel.full_name}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        '${UserProfileCubit.get(context).userModel.about}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Edit();
                                  },
                                ),
                              );
                            },
                            child: Icon(Icons.edit_outlined)),
                      ),
                    ],
                  ),
                  fallback: (context) => Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ConditionalBuilder(
                    condition:
                        UserProfileCubit.get(context).userProfilePostsModel !=
                            null,
                    builder: (context) {
                      return SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: 10.0,
                              ),
                              itemBuilder: (context, index) {
                                String subOfScore =
                                    ((model.data[index].dataset.score * 100).toString())
                                        .substring(0, 2);
                                return buildPostItem(context, model.data[index],
                                    index, subOfScore);
                              },
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
                ),
              ],
            ),
          ));
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

  Widget buildPostItem(
          context, HomePostsItemModel model, int index, String score) =>
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
                Wrap(
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
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                            child: Text(
                          model.created_at,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(height: 1.4),
                        )),
                      ],
                    ),
                    //start
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Category',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  model.dataset.category_list,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Country',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  model.dataset.country_code,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Percentage',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  ('$score %'),
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // end
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
