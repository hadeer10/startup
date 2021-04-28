
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/constants.dart';
import 'package:image_picker/image_picker.dart';

class bodyprofile extends StatefulWidget {
  @override
  _bodyprofileState createState() => _bodyprofileState();
}

class _bodyprofileState extends State<bodyprofile> {
  final picker = ImagePicker();
  File image , backimage;
  final backpicker = ImagePicker();

  getbackImage(ImageSource sr) async {
    final backpickerpath = await picker.getImage(source: sr);
    if (backpicker != null) {
      setState(() {
        backimage = File(backpickerpath.path);
      });
    }
  }
  getImage(ImageSource src) async {
    final pickerpath = await picker.getImage(source: src);
    if (picker != null) {
      setState(() {
        image = File(pickerpath.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 1,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      FlatButton(
                        child: backimage == null ? Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: kPrimaryLightColor)),
                           child: Icon(Icons.camera_alt_outlined,  size: 100.0 ,)):
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: kPrimaryLightColor)),
                            child: Image.file(
                              backimage,
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                        ),
                        onPressed: (){
                          AlertDialog alart = AlertDialog(
                            title: Text('Select photo'),
                            content: Container(
                              height: 150,
                              child: Column(
                                children: [
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Container(
                                    color: kPrimaryLightColor,
                                    child: ListTile(
                                      title: Text('Camera'),
                                      leading: Icon(Icons.camera_alt_outlined , color: kPrimaryColor,),
                                      onTap: () {
                                        getbackImage(ImageSource.camera);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    color: kPrimaryLightColor,
                                    child: ListTile(
                                      title: Text('Gallery'),
                                      leading: Icon(Icons.image , color: kPrimaryColor),
                                      onTap: () {
                                        getbackImage(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                          showDialog(context: context,  builder: (BuildContext context) {
                            return alart;
                          },);
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                        child: FlatButton(
                          child: image == null ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(width: 2, color: kPrimaryLightColor)),
                              child: ClipOval(child: Icon(Icons.camera_alt_outlined,  size: 100.0 ,))):
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 2, color: kPrimaryLightColor)),
                            child: ClipOval(
                              child: Image.file(
                                image,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          onPressed: (){
                            AlertDialog alart = AlertDialog(
                              title: Text('Select photo'),
                              content: Container(
                                height: 150,
                                child: Column(
                                  children: [
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Container(
                                      color: kPrimaryLightColor,
                                      child: ListTile(
                                        title: Text('Camera'),
                                        leading: Icon(Icons.camera_alt_outlined , color: kPrimaryColor,),
                                        onTap: () {
                                          getImage(ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      color: kPrimaryLightColor,
                                      child: ListTile(
                                        title: Text('Gallery'),
                                        leading: Icon(Icons.image , color: kPrimaryColor),
                                        onTap: () {
                                          getImage(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                            showDialog(context: context,  builder: (BuildContext context) {
                              return alart;
                            },);
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Text('Hadeer Hassan' , style: TextStyle(fontWeight: FontWeight.bold),),
                    padding: EdgeInsets.all(7),
                  ),
                  Container(
                    padding: EdgeInsets.all(7),
                    child: Text('hadeer@gmail.com' , style: TextStyle(color: Colors.grey)),
                  ),
                  Container(
                    padding: EdgeInsets.all(7),
                    child: Text('0125689855'),
                  ),
                  Container(
                    padding: EdgeInsets.all(7),
                    child: Text('Bio' , style: TextStyle(color: Colors.grey)),
                  ),
                  Divider(
                    color: kPrimaryColor,
                  ),
                  Center(
                    child: Text('No StartUp' ,
                    style: TextStyle(color: Colors.grey),),
                  )
                ],
              ),

      ),
          ],
        ),
    );

  }
}
