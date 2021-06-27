import 'package:flutter/material.dart';
import 'package:flutter_auth/models/home_post_model.dart';

class PostUserProfile extends StatelessWidget {
  User user;
  PostUserProfile(this.user);
   String avatar =
          'https://image.freepik.com/free-vector/businessman-avatar-character_24877-57842.jpg';
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(children: [
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
                        '${'name ${user.full_name}'}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        '${'bio ${user.about}'}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
        ],)
       ),
    );
  }
}
/**
 *  /* Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(
                  /*model.user.avatar*/ 'https://image.freepik.com/free-photo/portrait-cheerful-excited-tablet-user-wearing-eyeglasses_1262-18272.jpg'),
            ),
            SizedBox(
              height: 30,
            ),
            Text('name ${user.full_name}'),
            SizedBox(
              height: 30,
            ),
            Text('email'),
            SizedBox(
              height: 30,
            ),
            Text('bio ${user.about}'),
          ],
        ),*/
      
 */