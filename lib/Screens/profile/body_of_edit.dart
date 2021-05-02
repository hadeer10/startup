
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../modeproviderr.dart';
import 'package:toast/toast.dart';
class bodyedit extends StatefulWidget {
  @override
  _bodyeditState createState() => _bodyeditState();
}

class _bodyeditState extends State<bodyedit> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController emailcontroller=new TextEditingController();
  TextEditingController phonecontroller=new TextEditingController();
  TextEditingController biocontroller=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    ValueChanged<String> onChanged;
    Widget child;
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Edit Profile",
              style: TextStyle(fontWeight: FontWeight.bold , color: Provider.of<Myproiderr>(context).white),
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
                keyboardType: TextInputType.emailAddress,
                controller: emailcontroller,
                onChanged: onChanged,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: kPrimaryColor,
                  ),
                  hintText: 'Email',
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: phonecontroller,
                onChanged: onChanged,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.phone,
                    color: kPrimaryColor,
                  ),
                  hintText: 'phone',
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                controller: biocontroller,
                onChanged: onChanged,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.edit,
                    color: kPrimaryColor,
                  ),
                  hintText: 'Bio',
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: RoundedButton(
                  text: "SAVE",
                  press: () {
                    Provider.of<Myproiderr>(context , listen: false).editprofile(context, namecontroller.text, emailcontroller.text, phonecontroller.text, biocontroller.text);
                    namecontroller.text='';
                    phonecontroller.text='';
                    biocontroller.text='';
                    emailcontroller.text='';
                    Toast.show("SAVED", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
