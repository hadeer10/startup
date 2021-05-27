
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/profile/body_of_profile.dart';
import 'package:flutter_auth/Screens/profile/edit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../modeproviderr.dart';


class profile extends StatelessWidget {
  static String id = 'AddStartUpScreen';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
