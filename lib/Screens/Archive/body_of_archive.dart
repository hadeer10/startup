import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Archive/background.dart';
import 'package:flutter_auth/Screens/profile/profile.dart';
import 'package:flutter_auth/constants.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import '../../init.dart';
import '../../modeproviderr.dart';


class ArchiveBody extends StatefulWidget {
  static String id = 'ArchiveBody';
  @override
  _ArchiveBodyState createState() => _ArchiveBodyState();
}

class _ArchiveBodyState extends State<ArchiveBody> {
  var image;
  var red = Colors.red;
  var grey = Colors.grey;
  @override
  Widget build(BuildContext context) {
    image=Provider.of<Myproiderr>(context,listen: true).image;
    return Background(
      child:
      startupsList.isEmpty
          ? Center(
          child: Text('No Archived Startup.', style: TextStyle(color: Provider.of<Myproiderr>(context).white,)))
          :
      Padding(
        padding: const EdgeInsets.all(1.0),
        child: ListView.builder(
          itemCount: archive.length,
          itemBuilder: (context, i) =>
              Dismissible(
            key: Key(archive[i].name),
            background: Container(
              alignment: Alignment.centerRight,
              color: kPrimaryLightColor,
              child: Icon(
                Icons.delete,
                color: kPrimaryColor,
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                archive.removeAt(i);
              });
            },
            direction: DismissDirection.endToStart,
            child:

            Card(
              color: Provider.of<Myproiderr>(context).backofcard,
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
                              child: image == null
                                  ? Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              width: 2,
                                              color: kPrimaryLightColor)),
                                      child: ClipOval(
                                          child: Icon(
                                        Icons.camera_alt_outlined,
                                        size: 50.0,
                                            color: Provider.of<Myproiderr>(context).white,
                                      )))
                                  : Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              width: 2,
                                              color: kPrimaryLightColor)),
                                      child: ClipOval(
                                        child: Image.file(
                                          image,
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Profile(),
                                  ),
                                );
                              },
                            ),
                            TextButton(
                              child: Column(
                                children: [
                                  Text(
                                    Provider.of<Myproiderr>(context).name,
                                    style: TextStyle(color: Provider.of<Myproiderr>(context).white,),
                                  ),
                                  Text(
                                    Provider.of<Myproiderr>(context).email,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Profile(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text(archive[i].name, style: TextStyle(color: Provider.of<Myproiderr>(context).white,),),
                      subtitle: Text(archive[i].status, style: TextStyle(color: Provider.of<Myproiderr>(context).white,),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              LikeButton(
                                isLiked: Provider.of<Myproiderr>(context,listen: false).isLiked ?false : true,
                                likeCount: Provider.of<Myproiderr>(context,listen: false).txt ? 0 : 1,
                              ),
                              /*IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: Provider.of<Myproiderr>(context,listen: false).isLiked ? grey : red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    Provider.of<Myproiderr>(context,listen: false).m();
                                  });
                                },
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(Provider.of<Myproiderr>(context,listen: true).txt ? '0' : '1', style: TextStyle(color: Provider.of<Myproiderr>(context).white,),),

                               */
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.message,
                               color: kPrimaryLightColor,
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text('message', style: TextStyle(color: Provider.of<Myproiderr>(context).white,)),
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
      ),
    );
  }
}
