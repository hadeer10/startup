import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/chat_screen/chat_screen.dart';
import 'package:flutter_auth/Screens/profile/profile.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/startup.dart';
import 'package:flutter_auth/widgets/home_drawer.dart';
import 'package:provider/provider.dart';
import '../../add_startup/add_startup_screen.dart';
import '../../add_startup/startup_item_screen.dart';
import '../../init.dart';
import '../../modeproviderr.dart';
class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var red = Colors.red;
  var grey = Colors.grey;
  var image;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  String whatHappened;
   addToArchive(StartUp Startup) {
    setState(() {
      archive.add(Startup);
    });
  }
  var back;
  var white;
  var islike;
  var txt;
  @override
  Widget build(BuildContext context) {
    var namecontroller;
    var onChanged;
    var size=MediaQuery.of(context).size;
     back = Provider.of<Myproiderr>(context).backofcard;
     white =Provider.of<Myproiderr>(context).white;
     image=Provider.of<Myproiderr>(context,listen: true).image;
     islike=Provider.of<Myproiderr>(context,listen: true).isLiked;
     txt=Provider.of<Myproiderr>(context,listen: true).txt;
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Provider.of<Myproiderr>(context).appbarcolor,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            color: kPrimaryColor,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
          width:size.width,
          child: TextField(
              controller: namecontroller,
              onChanged: onChanged,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: kPrimaryColor,
                ),
                hintText: 'search',
                hintStyle: TextStyle( color: Colors.grey , height: 1),
                border: InputBorder.none,
              ),
          ),
        ),
        actions: [
        IconButton(
          icon: Icon(Icons.message,
            color: kPrimaryColor,
          ),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => chatscreen(),
              ),
            );
          },
        ),
        ],
      ),
      drawer: HomeDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: startupsList.length,
            itemBuilder: (context, i) => Dismissible(
                  key: Key(startupsList[i].name),
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
                      startupsList.removeAt(i);
                    });
                  },
              secondaryBackground:Container(
                alignment: Alignment.centerRight,
                color: kPrimaryLightColor,
                child: Icon(
                  Icons.delete,
                  color: kPrimaryColor,
                ),
              ),
              confirmDismiss: (DismissDirection dismissDirection) async {
                switch(dismissDirection) {
                  case DismissDirection.endToStart:
                    whatHappened = 'DELETED';
                    return await _showConfirmationDialog(context, 'Delete' ) == true;
                  case DismissDirection.startToEnd:
                    whatHappened = 'ARCHIVED';
                    return await _showConfirmationDialog(context, 'Archive' ) == true;
                  case DismissDirection.horizontal:
                  case DismissDirection.vertical:
                  case DismissDirection.up:
                  case DismissDirection.down:
                    assert(false);
                }
                return false;
              },
                  child: Card(
                    color: Provider.of<Myproiderr>(context).backofcard,
                    child: Column(
                      children: [
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
                                          child: ClipOval(child: Icon(Icons.camera_alt_outlined,
                                            color: Provider.of<Myproiderr>(context).white,
                                            size: 50.0 ,))):
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
                                          Text(Provider.of<Myproiderr>(context).name , style: TextStyle(color:white),
                                          ),
                                          Text( Provider.of<Myproiderr>(context).email , style: TextStyle(color: Colors.grey),),
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
                            onTap: () {
                              Navigator.pushNamed(context, StartUpItemScreen.id,
                                  arguments: {'name': startupsList[i].name});
                            },
                            title: Text(startupsList[i].name , style: TextStyle(color: Provider.of<Myproiderr>(context).white,),),
                            subtitle: Text(startupsList[i].status, style: TextStyle(color: Provider.of<Myproiderr>(context).white,),),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
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
                                    Text(txt ? '0' : '1' , style: TextStyle(color: Provider.of<Myproiderr>(context).white,),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.message , color: kPrimaryLightColor,),
                                      onPressed: () {

                                      },
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text('message', style: TextStyle(color: Provider.of<Myproiderr>(context).white,),),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: Provider.of<Myproiderr>(context).divider,
                          ),
                        ]),
                      ],
                    ),
                  ),
                )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryLightColor,
        child: Icon(
          Icons.add,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AddStartUpScreen.id);
        },
      ),
    );
  }

  Future<bool> _showConfirmationDialog(BuildContext context, String s ) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: back,
          title: Text('Do you want to $s this item?',
            style: TextStyle(color: white),),
          actions: <Widget>[
            FlatButton(
              child: const Text('Yes',style: TextStyle(color: kPrimaryColor),),
              onPressed: () {
                if(whatHappened=='ARCHIVED' ||DismissDirection.startToEnd ==true){
                  addToArchive(startupsList.first);
                }
            Navigator.pop(context, true);
                }
            ),
            FlatButton(
              child: const Text('No',style: TextStyle(color: kPrimaryColor),),
              onPressed: () {
                Navigator.pop(context, false); // showDialog() returns false
              },
            ),
          ],
        );
      },
    );
  }
}
