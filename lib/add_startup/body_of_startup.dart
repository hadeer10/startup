import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../modeproviderr.dart';
import 'add_startup_screen2.dart';
import 'body2_of_startup.dart';
class StartUpScreen extends StatefulWidget {
  static String id = 'AddStartUpScreen';

  @override
  _StartUpScreenState createState() => _StartUpScreenState();
}
class _StartUpScreenState extends State<StartUpScreen> {
  ValueChanged<String> onChanged;
  Widget child;
   TextEditingController titlecontroller;
   TextEditingController contentcontroller;
   TextEditingController imagecontroller;
  String title;
  String content;
  String image;
  File imagedisplay;
  var white;
  var back;
  final picker = ImagePicker();
  getImage(ImageSource src) async {
    final pickerpath = await picker.getImage(source: src);
    if (picker != null) {
      imagedisplay = File(pickerpath.path);
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    white=Provider.of<Myproiderr>(context ).white;
    back=Provider.of<Myproiderr>(context).appbarcolor;
    Widget continueButton = FlatButton(
      child: Text("cancel" ,style: TextStyle(color: kPrimaryColor), ),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget cancelButton = FlatButton(
      child: Text("Add" , style: TextStyle(color: kPrimaryColor),),
      onPressed:  () {
        setState(() {
          title=titlecontroller.text;
          content=contentcontroller.text;
          image=imagecontroller.text;
        });
      },
    );
    return Background(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Add Start Up",
              style: TextStyle(fontWeight: FontWeight.bold
                , color: Provider.of<Myproiderr>(context).white,),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.03),
            TextFieldContainer(
              child: TextField(
                controller: titlecontroller,
                onChanged: onChanged,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.drive_file_rename_outline,
                    color: kPrimaryColor,
                  ),
                  hintText: 'Title',
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
             child: TextField(
                controller: contentcontroller,
                onChanged: onChanged,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.text_fields,
                    color: kPrimaryColor,
                  ),
                  hintText: 'Content',
                  border: InputBorder.none,
                ),
              ),
            ),
            FlatButton(
              onPressed: (){
                AlertDialog alart = AlertDialog(
                  backgroundColor: back,
                  title: Text('Select photo',style: TextStyle(color: white),),
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
                             getImage(ImageSource.camera );
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
              child:
              imagedisplay==null
                  ?
               Container(
                 margin: EdgeInsets.symmetric(vertical: 10),
                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                 width: MediaQuery.of(context).size.width * 0.8,
                 decoration: BoxDecoration(
                   color: kPrimaryLightColor,
                   borderRadius: BorderRadius.circular(29),),
                 child: Row(
                   children: [
                     Icon(Icons.image,color: kPrimaryColor,),
                     Text('     Image'),
                   ],
                 ),
               ):
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29),),
                child: Container(
                  child: Image.file(
                    imagedisplay,
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
            ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: RoundedButton(
                  text: "Next",
                  press: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AddStartUpScreen2();
                    },
                  )),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}