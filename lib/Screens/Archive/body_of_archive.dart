
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/profile/profile.dart';
import 'package:flutter_auth/constants.dart';

class ArchiveBody extends StatefulWidget {
  @override
  _ArchiveBodyState createState() => _ArchiveBodyState();
}

class _ArchiveBodyState extends State<ArchiveBody> {
  var image;
  var red = Colors.red;
  var grey = Colors.grey;
  bool txt = true;
  bool isLiked = true;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder:(context , i) => /*Dismissible(
            key: Key(),
            background: Container(
              alignment: Alignment.centerLeft,
              color: kPrimaryLightColor,
              child: Icon(
                Icons.archive,
                color: kPrimaryColor,
              ),
            ),
            onDismissed: (direction) {
              setState(() {

              });
            },
      */
          Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
            SizedBox(
              height: 5,
            ),
            Column(children: [
              Row(
                children: [
                  Row(
                    children: [
                      FlatButton(
                        child: image == null ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 2, color: kPrimaryLightColor)),
                            child: ClipOval(child: Icon(Icons.camera_alt_outlined,  size: 50.0 ,))):
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: 2, color: kPrimaryLightColor)),
                          child: ClipOval(
                            child: Image.file(
                              image,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => profile(),
                            ),
                          );
                        },
                      ),
                      TextButton(
                        child: Column(
                          children: [
                            Text( "Hadeer Hassan" , style: TextStyle(color: Colors.black),
                            ),
                            Text( "Hadeer@gmail.com" , style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>profile(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              ListTile(
                title: Text('mm'),
                subtitle: Text('jj'),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: isLiked ? grey : red,
                          ),
                          onPressed: () {
                            setState(() {
                              isLiked = !isLiked;
                              txt = !txt;
                            });
                          },
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(txt ? '0' : '1'),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.message),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text('message'),
                      ],
                    )
                  ],
                ),
              ),
            ]),
        ],
      ),
    ),
          ),
        ),
    );
  }
}
