
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/body.dart';

import 'body_of_startup.dart';

class AddStartUpScreen extends StatelessWidget {
  static String id = 'AddStartUpScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StartUpScreen(),
    );
  }
}
