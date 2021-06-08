import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/add_startup/add_startup_screen2.dart';
import 'package:flutter_auth/components/components.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/cubit/create_post_cubit/cubit.dart';
import 'package:flutter_auth/cubit/create_post_cubit/states.dart';
import 'package:flutter_auth/modeproviderr.dart';
import 'package:flutter_auth/widgets/rounded_input_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AddStartUpScreen extends StatelessWidget {
  static String id = 'AddStartUpScreen';
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var white = Provider.of<Myproiderr>(context).white;
    var back = Provider.of<Myproiderr>(context).appbarcolor;
    return  BlocConsumer<CreatePostCubit, CreatePostStates>(
      listener: (context, state) {
        if (state is CreatePostPart1SuccessState) {
          print('post created successfully');
          print(state.post1model.id);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AddStartUpScreen2()));
        }

        if (state is CreatePostPart1ErrorState) {
          print('error create post');
          print('error is : ${state.error}');
          showToast(
              text: 'some thing wrong .. try again ! .', color: kErrorColor);
        }
      },
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
                    Text(
                      "Add Start Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Provider.of<Myproiderr>(context).white,
                      ),
                    ),
                    SizedBox(height: size.height * 0.06),
                    RoundedFormInputField(
                        controller: titleController,
                        hintText: 'Title',
                        icon: Icons.drive_file_rename_outline,
                        type: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'title must not be empty !';
                          }
                        }),
                    RoundedFormInputField(
                        controller: contentController,
                        hintText: 'Content',
                        icon: Icons.text_fields,
                        type: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'content must not be empty !';
                          }
                        }),
                    // TODO: handle get image for post create part 1
                    /*FlatButton(
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
                          ),*/
                    Container(
                      margin: EdgeInsets.all(8),
                      child: RoundedButton(
                        text: "Next",
                        press: () {
                          /* send request create post part 1 and then listen to resposnse
                          when successfully => get post id to can send request create post part 2 */

                          if (formKey.currentState.validate()) {
                            CreatePostCubit.get(context).createPost1(
                                title: titleController.text,
                                content: contentController.text);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
