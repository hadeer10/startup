import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class Myproiderr with ChangeNotifier{
  bool vals=false;
 ThemeMode tm = ThemeMode.light;
  Color backofcard;
  Color appbarcolor;
  Color white;
  Color divider;
  Color light;
  String name ="Hadeer Hassan";
  String email="hadeer@gmail.com";
  String phone='12354687';
  String bio;
  bool isLiked = true;
  bool txt = true;
  final picker = ImagePicker();
  File image , backimage;
  final backpicker = ImagePicker();
  getbackImage(ImageSource sr ) async {
    final backpickerpath = await picker.getImage(source: sr);
    if (backpicker != null) {
        backimage = File(backpickerpath.path);
    }
    notifyListeners();
  }
  getImage(ImageSource src) async {
    final pickerpath = await picker.getImage(source: src);
    if (picker != null) {
      image = File(pickerpath.path);
    }
    notifyListeners();
  }
void switchs(bool val){
  vals=val;
  if(vals==false){
    tm=ThemeMode.light;
    backofcard = Colors.white;
    appbarcolor=Colors.white;
    white=HexColor("#050613");
    divider=Colors.white;
    light=kPrimaryLightColor;
  }
  else{
    tm=ThemeMode.dark;
    backofcard = HexColor("#050613");
    appbarcolor=HexColor("#050613");
    white=Colors.white;
    divider=Colors.grey;
    light=kPrimaryColor;
  }
  notifyListeners();
}
void m(){
  isLiked = !isLiked;
  txt = !txt;
}
void editprofile(var context , var namecontroller, var  emailcontroller , var phonecontroller , var biocontroller ){
name=namecontroller;
email=emailcontroller;
phone=phonecontroller;
bio=biocontroller;
}
}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
