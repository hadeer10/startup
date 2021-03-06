
import 'package:flutter/material.dart';
import 'package:flutter_auth/widgets/home_drawer.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../modeproviderr.dart';
import 'chat_details.dart';
class chatscreen extends StatelessWidget {
  final List<person> persondetails = [
    person(
        name: 'Hadeer',),
    person(
        name: 'Malak',),
    person(
        name: 'Passant',),
    person(
      name: 'Yousef',),
    person(
      name: 'Ahmed',),
    person(
      name: 'Mohamed',),
    person(
      name: 'Hossam',),
  ];
  var namecontroller;
  var onChanged;
  var image;
  @override
  Widget build(BuildContext context) {
    image=Provider.of<Myproiderr>(context,listen: true).image;
    return Scaffold(
       appBar: AppBar(
      backgroundColor: Provider.of<Myproiderr>(context).appbarcolor,
         leading: Builder(
           builder: (context) => FlatButton(
             child: image == null ? Container(
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(100),
                     border: Border.all(width: 1, color: kPrimaryLightColor)),
                 child: ClipOval(child: Icon(Icons.camera_alt_outlined,
                   color: Provider.of<Myproiderr>(context).white,
                   size: 23.0 ,))):
             Container(
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(90),
                   border: Border.all(width: 1, color: kPrimaryLightColor)),
               child: ClipOval(
                 child: Image.file(
                   image,
                   height: 25,
                   width: 100,
                   fit: BoxFit.cover,
                 ),
               ),
             ),
             onPressed: () => Scaffold.of(context).openDrawer(),
           ),
         ),
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
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
       ),
      drawer: HomeDrawer(),
      body: ListView.builder(
        itemCount: persondetails.length,
          itemBuilder:  (context, i) =>  InkWell(
            onTap: (){
              Navigator.pushNamed(context, chatdetails.id  ,
                  arguments: {'name': persondetails[i].name});
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                        'https://image.shutterstock.com/image-photo/closeup-photo-amazing-short-hairdo-260nw-1617540484.jpg'
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Text(persondetails[i].name ,style: TextStyle(fontWeight: FontWeight.bold , height: 1.4 , color: Provider.of<Myproiderr>(context).white) ,
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
class person{
  final String name;
  person({this.name,});
}

