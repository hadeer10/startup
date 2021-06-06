
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/home.dart';
import 'package:flutter_auth/Screens/profile/body_of_profile.dart';
import 'package:flutter_auth/Screens/profile/edit.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../modeproviderr.dart';


class profile extends StatelessWidget {
  static String id = 'AddStartUpScreen';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        backgroundColor: Provider.of<Myproiderr>(context).appbarcolor,
        title: Text('Profile', style: TextStyle(color: Provider.of<Myproiderr>(context).white,),),
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
      body: bodyprofile(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryLightColor,
        child: Icon(Icons.edit, color: kPrimaryColor,),
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
      ),
    );
  }
}
