import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/home.dart';
import 'package:flutter_auth/Screens/profile/edit.dart';
import 'package:flutter_auth/cubit/user_profile_cubit/cubit.dart';
import 'package:flutter_auth/cubit/user_profile_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../modeproviderr.dart';

class profile extends StatelessWidget {
  static String id = 'AddStartUpScreen';
  var model;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileCubit, UserProfileStates>(
        builder: (context, state) {
          String fullName = 'no user name';
          String avatar =
              'https://image.freepik.com/free-vector/businessman-avatar-character_24877-57842.jpg';
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
              body: ConditionalBuilder(
                condition: UserProfileCubit.get(context).userModel != null,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
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
                        '${UserProfileCubit.get(context).userModel.first_name}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        '${UserProfileCubit.get(context).userModel.about}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Posts',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            OutlinedButton(
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
                                child: Row(
                                  children: [
                                    Text('Edit Profile  '),
                                    Icon(Icons.edit_outlined)
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ));
        },
        listener: (context, state) {});
  }
}
