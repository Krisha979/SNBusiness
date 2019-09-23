import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:snbiz/src_code/home.dart';
import 'package:snbiz/src_code/login.dart';
import 'package:snbiz/src_code/splash_screen.dart';


 void main() {
    runApp(new MyApp());
}
// stateless widget is used when data cannot be changed
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
    debugShowCheckedModeBanner: false,
   
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      "/login": (BuildContext context) =>  new LoginPage(),
     // "/home": (BuildContext context) => new Home(),


    }
    );
  }
}