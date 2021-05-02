import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Archive/background.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../modeproviderr.dart';

class bodyprofile extends StatefulWidget {
  static String id = 'bodyprofile';
  @override
  _bodyprofileState createState() => _bodyprofileState();
}

class _bodyprofileState extends State<bodyprofile> {
  var back;
  var white;
  var image;
  var bacimage;
  @override
  Widget build(BuildContext context) {
    white=Provider.of<Myproiderr>(context ).white;
    back=Provider.of<Myproiderr>(context).appbarcolor;
    image=Provider.of<Myproiderr>(context,listen: true).image;
    bacimage=Provider.of<Myproiderr>(context,listen: true).backimage;
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
                      child: bacimage == null ? Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: kPrimaryLightColor)),
                          child: Icon(Icons.camera_alt_outlined,  size: 100.0 ,
                          color: white,
                          )):
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: kPrimaryLightColor)),
                        child: Image.file(
                          bacimage,
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                      ),
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
                                      Provider.of<Myproiderr>(context , listen: false).getbackImage(ImageSource.gallery);
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
                                      Provider.of<Myproiderr>(context , listen: false).getbackImage(ImageSource.gallery);
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
                      padding: const EdgeInsets.fromLTRB(0, 83, 0, 0),
                      child: FlatButton(
                        child: image == null ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 2, color: kPrimaryLightColor)),
                            child: ClipOval(child: Icon(Icons.camera_alt_outlined,  size: 100.0 , color: white,))):
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
                                        Provider.of<Myproiderr>(context , listen: false).getImage(ImageSource.camera );

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
                                        Provider.of<Myproiderr>(context , listen: false).getImage(ImageSource.gallery);

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
                  child: Text(Provider.of<Myproiderr>(context).name , style: TextStyle(fontWeight: FontWeight.bold , color: white),),
                  padding: EdgeInsets.all(7),
                ),
                Container(
                  padding: EdgeInsets.all(7),
                  child: Text(Provider.of<Myproiderr>(context).email , style: TextStyle(color: Colors.grey)),
                ),
                Container(
                  padding: EdgeInsets.all(7),
                  child: Text(Provider.of<Myproiderr>(context).phone , style: TextStyle(color: white),),
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
