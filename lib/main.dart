import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/home.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/cubit/home_posts_cubit/cubit.dart';
import 'package:flutter_auth/cubit/my_bloc_observer.dart';
import 'package:flutter_auth/network/local/cache_helper.dart';
import 'package:flutter_auth/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'Screens/chat_screen/chat_details.dart';
import 'Screens/profile/body_of_profile.dart';
import 'add_startup/add_startup_screen.dart';
import 'add_startup/startup_item_screen.dart';
import 'modeproviderr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  accessToken = CacheHelper.getData(key: 'access_token');
  Widget widget;
// check if user logged in or not
  if (accessToken != null) {
    print('access token is  $accessToken');
    widget = HomeScreen();
  } else {
    print('access token is  $accessToken');
    widget = WelcomeScreen();
  }

  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  Widget widget;
  MyApp(this.widget);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
              create: (BuildContext context) => HomeCubit()..getPosts()),
              
        ],
        child: ChangeNotifierProvider<Myproiderr>(
          create: (ctx) => Myproiderr(),
          child: MyHomePage(widget),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  Widget widget;
  MyHomePage(this.widget);
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
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Provider.of<Myproiderr>(context).appbarcolor,
        canvasColor: Provider.of<Myproiderr>(context).appbarcolor,
      ),
      title: 'MyHomePage',
      home: widget.widget,
      routes: {
        StartUpItemScreen.id: (context) => StartUpItemScreen(),
        AddStartUpScreen.id: (context) => AddStartUpScreen(),
        bodyprofile.id: (context) => bodyprofile(),
        chatdetails.id: (context) => chatdetails(),
      },
    );
  }
}
