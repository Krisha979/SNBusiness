import 'package:firebase_cloud_messaging/firebase_cloud_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:snbiz/src_code/home.dart';
import 'package:snbiz/src_code/login.dart';


 void main() {
    runApp(new MyApp());
}


// stateless widget is used when data cannot be changed
class MyApp extends StatelessWidget{
      final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  void initstate(){
   _firebaseMessaging.configure(
       
       onMessage: (Map<String, dynamic> message) async {
         print("onMessage: $message");
         myBackgroundMessageHandler(message);

       },
      
       onLaunch: (Map<String, dynamic> message) async {
         print("onLaunch: $message");
         myBackgroundMessageHandler(message);
       
       },
       onResume: (Map<String, dynamic> message) async {
         print("onResume: $message");
        myBackgroundMessageHandler(message);

       },
     );
}
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
    debugShowCheckedModeBanner: false,
   
    home: LoginPage(),
    );
  }
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
   if (message.containsKey('data')) {
     // Handle data message
     final dynamic data = message['data'];
   }

   if (message.containsKey('notification')) {
     // Handle notification message
     final dynamic notification = message['notification'];
   }

   // Or do other work.
 }