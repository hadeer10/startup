import 'package:flutter/material.dart';

class StartUpItemScreen extends StatelessWidget {
  static String id = 'StartUpItemScreen';

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('StartUp Item'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Container(
            child: Text(args['name']),
          ),
        ),
      ),
    );
  }
}
