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
  @override
  Widget build(BuildContext context) {
    white=Provider.of<Myproiderr>(context ).white;
    back=Provider.of<Myproiderr>(context).appbarcolor;
    image=Provider.of<Myproiderr>(context,listen: true).image;
    return Background(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 1,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                FlatButton(
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
                                        Provider.of<Myproiderr>(context , listen: false).getImage(ImageSource.gallery);
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
                  height: 7,
                ),
                Container(
                 padding: EdgeInsets.symmetric(horizontal: 50, vertical:10),
                 decoration: BoxDecoration(
                 color: kPrimaryLightColor,
                 borderRadius: BorderRadius.circular(29),),
                  child: Text('full name ', style: TextStyle(fontWeight: FontWeight.bold , color: white),),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(29),),
                  child: Text('Bio' , style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
