import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Archive/archive.dart';
import 'package:flutter_auth/Screens/HomePage/home.dart';
import 'package:flutter_auth/Screens/profile/profile.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/svg.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: kPrimaryLightColor,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 0,
                    height: 0,
                  ),
                  SvgPicture.asset(
                    "assets/icons/login.svg",
                    height: size.height * 0.20,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person ,  color: kPrimaryColor,),
            title: Text('Profile' ,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w100),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return profile();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.home , color: kPrimaryColor,),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w100),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings , color: kPrimaryColor,),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w100),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.archive , color: kPrimaryColor,),
            title: Text(
              'Archived',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w100),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Archive();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app ,  color: kPrimaryColor,),
            title: Text('Log Out',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w100),
            ),
            onTap: () {
            },
          )
        ],
      ),
    );
  }
}
