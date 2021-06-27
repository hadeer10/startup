import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/components/components.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/cubit/user_profile_cubit/cubit.dart';
import 'package:flutter_auth/cubit/user_profile_cubit/states.dart';
import 'package:flutter_auth/widgets/rounded_input_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Edit extends StatelessWidget {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController biocontroller = new TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var profileImage = UserProfileCubit.get(context).profileImage;
    var model = UserProfileCubit.get(context).userModel;
    namecontroller.text = model.full_name;
    biocontroller.text = model.about;
    return BlocConsumer<UserProfileCubit, UserProfileStates>(
        builder: (context, state) {
          return Scaffold(
            body: Background(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 64,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage: profileImage == null
                                  ? NetworkImage(
                                      /*'${model.image}*/ 'https://image.freepik.com/free-vector/businessman-avatar-character_24877-57842.jpg')
                                  : FileImage(profileImage),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                UserProfileCubit.get(context).getProfileImage();
                              },
                              icon: CircleAvatar(
                                child: Icon(Icons.camera_alt),
                              ))
                        ],
                      ),
                      SizedBox(height: size.height * 0.06),
                      RoundedFormInputField(
                          hintText: 'Full Name',
                          controller: namecontroller,
                          type: TextInputType.name,
                          icon: Icons.edit),
                      RoundedFormInputField(
                          hintText: 'Bio',
                          controller: biocontroller,
                          type: TextInputType.text,
                          icon: Icons.edit),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RoundedButton(
                            text: "SAVE",
                            press: () {
                              print(namecontroller.text);
                              print(biocontroller.text);
                              print(profileImage);

                              UserProfileCubit.get(context).updateUserData(
                                  namecontroller.text,
                                  biocontroller.text,
                                 /* '$profileImage'*/);
                                  showToast(text: 'Profile Updated Successfully .');
                                  Navigator.pop(context);
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
