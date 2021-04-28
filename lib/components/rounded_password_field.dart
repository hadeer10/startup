import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);
  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  @override
  Widget build(BuildContext context) {
    bool viasble = true;
    var press;
    return TextFieldContainer(
      child: TextField(
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              viasble? Icons.visibility:Icons.visibility_off ,
              color: kPrimaryColor,
            ),
            onPressed: (){
              viasble !=viasble;
            },
          ),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: viasble,
      ),
    );
  }
}
