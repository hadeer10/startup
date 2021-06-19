import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';

// used ////////

class RoundedFormInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final TextInputType type;
  final Function onSubmit;
  final Function validate;
   bool isPassword;
   IconData suffix;
   Function suffixPressed;

   RoundedFormInputField(
      {Key key,
      this.hintText,
      this.validate,
      this.type,
      this.onSubmit,
      this.isPassword=false,
      this.suffix,
      this.suffixPressed,
      this.icon ,
      this.onChanged,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        
        controller: controller,
        validator: validate,
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        obscureText: isPassword,
        
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  color:Colors.grey[700] ,
                  icon: Icon(

                    suffix,
                  ),
                )
              : null,
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
