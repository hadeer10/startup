import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/home.dart';
// used for add_post_screen_2 , after post created 
showAlertDialog(context, Color back, Color white, String score) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: back,
          title: Text(
            "Congratulations Your StartUp Added Successfully..",
            style: TextStyle(color: white),
          ),
          content: Text(
            'Your StartUp Score is : $score',
            style: TextStyle(color: white),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text('Finish '))
          ],
        );
      });
}
