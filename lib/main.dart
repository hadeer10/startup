import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';

import 'Screens/Archive/body_of_archive.dart';
import 'add_startup/add_startup_screen.dart';
import 'add_startup/startup_item_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
      routes: {
        StartUpItemScreen.id: (context) => StartUpItemScreen(),
        AddStartUpScreen.id: (context) => AddStartUpScreen(),
        ArchiveBody.id: (context) => ArchiveBody(),
      },
    );
  }
}
