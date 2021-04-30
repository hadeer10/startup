
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/profile/profile.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/startup.dart';
import 'package:flutter_auth/widgets/home_drawer.dart';
import '../../add_startup/add_startup_screen.dart';
import '../../add_startup/startup_item_screen.dart';
import '../../init.dart';
class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var red = Colors.red;
  var grey = Colors.grey;
  bool txt = true;
  bool isLiked = true;
  var image;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  String whatHappened;
   addToArchive(StartUp Startup) {
    setState(() {
      archive.add(Startup);
    });
  }

  @override
  Widget build(BuildContext context) {
    var namecontroller;
    var onChanged;
    var size=MediaQuery.of(context).size;
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            color: kPrimaryColor,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          width:size.width,
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(30),
          ),
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
                border: InputBorder.none,
              ),
          ),
        ),
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
                                          Text( "Hadeer@yahoo.com" , style: TextStyle(color: Colors.grey),),
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
                            title: Text(startupsList[i].name),
                            subtitle: Text(startupsList[i].status),
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
          title: Text('Do you want to $s this item?'),
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
