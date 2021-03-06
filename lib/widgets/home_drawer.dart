import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/home.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/profile/profile.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/cubit/home_posts_cubit/cubit.dart';
import 'package:flutter_auth/cubit/home_posts_cubit/states.dart';
import 'package:flutter_auth/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../modeproviderr.dart';

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
            leading: Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w100,
                color: Provider.of<Myproiderr>(context).white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Profile();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: kPrimaryColor,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w100,
                color: Provider.of<Myproiderr>(context).white,
              ),
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
         BlocConsumer<HomeCubit,HomeStates>(builder: (context,state){
           return  ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: kPrimaryColor,
            ),
            title: Text(
              'Log Out',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w100,
                color: Provider.of<Myproiderr>(context).white,
              ),
            ),
            onTap: () {
              HomeCubit.get(context).logout();
            },
          )
        ;
         }, listener: (context,state){
           if(state is HomeUserLogoutSuccessState){
             CacheHelper.removeData(key: 'refresh');
              CacheHelper.removeData(key: 'access_token').then((value) => Navigator.
              pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginScreen() )));
           }
         }),
         /*  Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: [
                Text("light",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w100,
                      color: Provider.of<Myproiderr>(context).white,
                    )),
                Switch(
                  value: Provider.of<Myproiderr>(context, listen: true).vals,
                  onChanged: (bool val) {
                    Provider.of<Myproiderr>(context, listen: false)
                        .switchs(val);
                  },
                  activeColor: kPrimaryColor,
                  inactiveThumbColor: kPrimaryColor,
                ),
                Text("dark",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w100,
                      color: Provider.of<Myproiderr>(context).white,
                    )),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
