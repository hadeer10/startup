import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/chat_screen/chat_screen.dart';
import 'package:flutter_auth/Screens/profile/profile.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/cubit/home_posts_cubit/cubit.dart';
import 'package:flutter_auth/cubit/home_posts_cubit/states.dart';
import 'package:flutter_auth/models/startup.dart';
import 'package:flutter_auth/widgets/home_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../add_startup/add_startup_screen.dart';
import '../../add_startup/startup_item_screen.dart';
import '../../init.dart';
import '../../modeproviderr.dart';
import 'package:like_button/like_button.dart';

//<calculated when request is sent>
class HomeScreen extends StatelessWidget {
  static String id = 'HomeScreen';

  var red = Colors.red;
  var grey = Colors.grey;
  var image;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  String whatHappened;
  addToArchive(StartUp Startup) {
    /* setState(() {
      archive.add(Startup);
    });*/
  }

  var back;
  var white;
  var islike;
  var txt;
  @override
  Widget build(BuildContext context) {
    var namecontroller;
    var onChanged;
    var size = MediaQuery.of(context).size;
    back = Provider.of<Myproiderr>(context).backofcard;
    white = Provider.of<Myproiderr>(context).white;
    image = Provider.of<Myproiderr>(context, listen: true).image;
    islike = Provider.of<Myproiderr>(context, listen: true).isLiked;
    txt = Provider.of<Myproiderr>(context, listen: true).txt;
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Provider.of<Myproiderr>(context).appbarcolor,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            color: kPrimaryColor,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
          width: size.width,
          child: TextField(
            controller: namecontroller,
            onChanged: onChanged,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                color: kPrimaryColor,
              ),
              hintText: 'search',
              hintStyle: TextStyle(color: Colors.grey, height: 1),
              border: InputBorder.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.message,
              color: kPrimaryColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => chatscreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: HomeDrawer(),
      body: BlocConsumer<HomeCubit, HomeStates>(builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return ConditionalBuilder(
          condition: HomeCubit.get(context).model != null,
          builder: (context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: cubit.model.data.length,
                itemBuilder: (context, index) => Card(
                  color: Provider.of<Myproiderr>(context).backofcard,
                  child: Column(children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            TextButton(
                              child: image == null
                                  ? Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              width: 2,
                                              color: kPrimaryLightColor)),
                                      child: ClipOval(
                                          child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: Provider.of<Myproiderr>(context)
                                            .white,
                                        size: 50.0,
                                      )))
                                  : Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              width: 2,
                                              color: kPrimaryLightColor)),
                                      child: ClipOval(
                                        child: Image.file(
                                          image,
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                              onPressed: () {
                                /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => profile(),
                                  ),
                                );*/
                              },
                            ),
                            TextButton(
                              child: Column(
                                children: [
                                  Text(
                                   'user name ',
                                    style: TextStyle(color: white),
                                  ),
                                  Text(
                                    'user email',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              onPressed: () {
                              /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => profile(),
                                  ),
                                );*/
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    ListTile(
                      onTap: () {
                        /*  Navigator.pushNamed(context, StartUpItemScreen.id,
                            arguments: {'name': startupsList[index].name});*/
                      },
                      title: Text(
                        cubit.model.data[index].title,
                        style: TextStyle(
                          color: Provider.of<Myproiderr>(context).white,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cubit.model.data[index].content,
                            style: TextStyle(
                              color: Provider.of<Myproiderr>(context).white,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            cubit.model.data[index].created_at,
                            style: TextStyle(
                              color: Provider.of<Myproiderr>(context).white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              LikeButton(
                                isLiked: Provider.of<Myproiderr>(context,
                                            listen: false)
                                        .isLiked
                                    ? false
                                    : true,
                                likeCount: cubit.model.data[index].likes.length,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.message,
                                  color: kPrimaryLightColor,
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'message',
                                style: TextStyle(
                                  color: Provider.of<Myproiderr>(context).white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Provider.of<Myproiderr>(context).divider,
                    ),
                  ]),
                ),
              )),
        );
      }, listener: (context, state) {
        if (state is HomeSuccessState) {
          print(state.model.toString());
        }
        if (state is HomeErrorState) {
          print(state.error);
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryLightColor,
        child: Icon(
          Icons.add,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AddStartUpScreen.id);
        },
      ),
    );
  }
}
