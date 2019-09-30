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
  void initstate(BuildContext context){
  _firebaseMessaging.configure(
          onMessage: (Map<String, dynamic> message) async {
            print("onMessage: $message");
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        content: ListTile(
                        title: Text(message['notification']['title']),
                        subtitle: Text(message['notification']['body']),
                        ),
                        actions: <Widget>[
                        FlatButton(
                            child: Text('Ok'),
                            onPressed: () => Navigator.of(context).pop(),
                        ),
                    ],
                ),
            );
        },
        onLaunch: (Map<String, dynamic> message) async {
            print("onLaunch: $message");
            // TODO optional
        },
        onResume: (Map<String, dynamic> message) async {
            print("onResume: $message");
            // TODO optional
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
Future<void> _alert(BuildContext context, String header, String body) {
                          
                        return showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                        return AlertDialog(
                            title: Text(header),
                            content: Text(body),
                        
                                actions: <Widget>[
                          
                                  FlatButton(
                                          child: Text('Ok', style: TextStyle(color: Colors.blue, fontSize: 12.0)),
                                          
                                          onPressed: () {
                                                     Navigator.of(context).pop();
                                    },
                                  ),
                               ],
                             );
                            },
                          );
                        }