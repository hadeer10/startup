
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Archive/body_of_archive.dart';
import 'package:flutter_auth/constants.dart';

class Archive extends StatefulWidget {
  @override
  _ArchiveState createState() => _ArchiveState();
}

class _ArchiveState extends State<Archive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        title: Text('Archive',
        style: TextStyle(color: Colors.black),
        ),
      ),
      body: ArchiveBody(),
    );
  }
}
