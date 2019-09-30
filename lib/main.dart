import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:snbiz/src_code/home.dart';
import 'package:snbiz/src_code/login.dart';


 void main() {
    runApp(new MyApp());
}
// stateless widget is used when data cannot be changed
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter',
      
      theme: ThemeData(
        
        primarySwatch: Colors.deepPurple
      ),
      debugShowCheckedModeBanner: false,
   
     
   
    home: LoginPage(),
    );
  }
}