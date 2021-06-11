import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/post_details.dart';
import 'package:flutter_auth/Screens/chat_screen/chat_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/cubit/home_posts_cubit/cubit.dart';
import 'package:flutter_auth/cubit/home_posts_cubit/states.dart';
import 'package:flutter_auth/models/home_post_model.dart';
import 'package:flutter_auth/widgets/home_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../add_startup/add_startup_screen.dart';
import '../../modeproviderr.dart';

//<calculated when request is sent>
class HomeScreen extends StatelessWidget {
  static String id = 'HomeScreen';

  var red = Colors.red;
  var grey = Colors.grey;
  var image;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  String whatHappened;

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
            builder: (context) => SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.0,
                        ),
                        itemBuilder: (context, index) =>
                            buildPostItem(context, cubit.model.data[index]),
                        itemCount: cubit.model.data.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ));
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

  Widget buildPostItem(context, HomePostsItemModel model) => Card(
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PostDetailsScreen(model)));
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
      );
}
//old post ui 
   /* Padding(
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
                              child: Text(
                                   'full name ',
                                    style: TextStyle(color: white),
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
              )),*/
        