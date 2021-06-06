import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:provider/provider.dart';
import '../modeproviderr.dart';
class StartUpScreen2 extends StatefulWidget {
  static String id = 'StartUpScreen2';
  @override
  _StartUpScreenState2 createState() => _StartUpScreenState2();
}
class _StartUpScreenState2 extends State<StartUpScreen2> {
  ValueChanged<String> onChanged;
  Widget child;
  TextEditingController fundingtotalcontroller;
  TextEditingController fundingroundcontroller;
  TextEditingController categorycontroller;
  TextEditingController citycontroller;
  String fundingtotal;
  String fundinground;
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
          fundingtotal=fundingtotalcontroller.text;
          fundinground=fundingroundcontroller.text;
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
                  hintText: 'Country_code',
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                controller: fundingtotalcontroller,
                onChanged: onChanged,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.drive_file_rename_outline,
                    color: kPrimaryColor,
                  ),
                  hintText: 'TotalUsed',
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                controller: fundingroundcontroller,
                onChanged: onChanged,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.drive_file_rename_outline,
                    color: kPrimaryColor,
                  ),
                  hintText: 'Round',
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
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Score" ,style: TextStyle(color: white),),
                            Text("MaxFund" ,style: TextStyle(color: white),),
                            Text("MinFund" ,style: TextStyle(color: white),),
                            Text("Status" ,style: TextStyle(color: white),),
                          ],
                        ),
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