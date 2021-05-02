
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Archive/body_of_archive.dart';
import 'package:flutter_auth/Screens/HomePage/home.dart';
import 'package:flutter_auth/constants.dart';
import 'package:provider/provider.dart';
import '../../modeproviderr.dart';

class Archive extends StatefulWidget {
  @override
  _ArchiveState createState() => _ArchiveState();
}

class _ArchiveState extends State<Archive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<Myproiderr>(context).appbarcolor,
        title: Text('Archive', style: TextStyle(color: Provider.of<Myproiderr>(context).white,),
        ),
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
      body: ArchiveBody(),
    );
  }
}
