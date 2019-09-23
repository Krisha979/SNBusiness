import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return SplashScreenState() ;
  }

}
class SplashScreenState extends State<SplashScreen>{
  
startTime() async{
  var duration = new Duration(seconds: 5);
  return Timer(duration, navigationPage);
}

void navigationPage(){
  Navigator.of(context).pushReplacementNamed("/login");
}

@override
void initState(){
  super.initState();
  startTime();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomPadding: false,
              body:new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                 new Container (
                  decoration:new BoxDecoration(
                    gradient: new LinearGradient(colors:[
                       const Color(0xFF915FB5),
                      const Color(0xFFCA436B),
                    ],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    stops: [0.0,1.0],
                    ),
                    ),
                 ),
                   new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[ 
                    Expanded(
                      flex: 2,
                    child: Container(
                      
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          new Image(
                          image: new AssetImage("assets/logo.jpg"),
                          height: 200.0,
                          width: 200.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),

                    ),
                    Text
                    ("SN Business Solutions",
                      style: TextStyle(
                      fontWeight:FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24.0
                       ),
                       ),
                     
                    Text
                    ("Pvt. Ltd",
                      style: TextStyle(
                      fontWeight:FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15.0
                         ),
                         ),
                      Padding(
                      padding: EdgeInsets.only(top: 8.0),

                    ),
                          ]
                      )
                      ,
                    
                    ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Padding(padding: EdgeInsets.only(top: 20.0),
                        ),
                      Text
                        ("Taking Business to new height",
                        style: TextStyle(
                        fontWeight:FontWeight.normal,
                        color: Colors.white,
                        fontSize: 18.0
                       ),
                       ),
                      ],
                      ),
                      )
                  ]
                   
                  )
              ]
                )
    );
  }
}
