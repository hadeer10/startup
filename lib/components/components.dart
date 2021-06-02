import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({@required String text,Color color}) =>
    Fluttertoast.showToast(
      backgroundColor: color,
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        textColor: Colors.white,
        fontSize: 16.0);