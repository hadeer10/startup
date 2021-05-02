import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'Screens/profile/body_of_profile.dart';
import 'add_startup/add_startup_screen.dart';
import 'add_startup/startup_item_screen.dart';
import 'modeproviderr.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyHomePage',
      home: ChangeNotifierProvider<Myproiderr>(
        create: (ctx) => Myproiderr(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: Provider.of<Myproiderr>(context).tm,
      theme: ThemeData(primaryColor: Colors.white ,  scaffoldBackgroundColor: Colors.white, ),
      darkTheme: ThemeData(primaryColor: HexColor("#050613") ,  scaffoldBackgroundColor: Provider.of<Myproiderr>(context).appbarcolor,
          canvasColor: Provider.of<Myproiderr>(context).appbarcolor,
      ),
      title: 'MyHomePage',
      home: WelcomeScreen(),
      routes: {
        StartUpItemScreen.id: (context) => StartUpItemScreen(),
        AddStartUpScreen.id: (context) => AddStartUpScreen(),
        bodyprofile.id: (context) => bodyprofile(),
      },
    );
  }
}
