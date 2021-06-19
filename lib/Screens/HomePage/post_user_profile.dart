import 'package:flutter/material.dart';
import 'package:flutter_auth/models/home_post_model.dart';

class PostUserProfile extends StatelessWidget {
  User user;
  PostUserProfile(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
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
        ),
      ),
    );
  }
}
