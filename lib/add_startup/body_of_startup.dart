import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:provider/provider.dart';

import '../modeproviderr.dart';
class StartUpScreen extends StatefulWidget {
  static String id = 'AddStartUpScreen';

  @override
  _StartUpScreenState createState() => _StartUpScreenState();
}
class _StartUpScreenState extends State<StartUpScreen> {
  ValueChanged<String> onChanged;
  Widget child;
   TextEditingController namecontroller;
   TextEditingController fieldcontroller;
   TextEditingController categorycontroller;
   TextEditingController citycontroller;
  String name;
  String field;
  String category;
  String city;
  var white;
  var back;
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
          name=namecontroller.text;
          field=fieldcontroller.text;
          category=categorycontroller.text;
          city=citycontroller.text;
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
                controller: namecontroller,
                onChanged: onChanged,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.drive_file_rename_outline,
                    color: kPrimaryColor,
                  ),
                  hintText: 'name',
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                controller: citycontroller,
                onChanged: onChanged,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.location_city,
                    color: kPrimaryColor,
                  ),
                  hintText: 'city',
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                controller: fieldcontroller,
                onChanged: onChanged,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.text_fields,
                    color: kPrimaryColor,
                  ),
                  hintText: 'field',
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                controller: categorycontroller,
                onChanged: onChanged,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.category,
                    color: kPrimaryColor,
                  ),
                  hintText: 'category',
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: RoundedButton(
                  text: "Result",
                  press: () {
                    setState(() {
                      AlertDialog alert = AlertDialog(
                        backgroundColor: back,
                        title: Text("Result" , style: TextStyle(color: white),),
                        content: Text("result....." ,style: TextStyle(color: white),),
                        actions: [
                          cancelButton,
                          continueButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}