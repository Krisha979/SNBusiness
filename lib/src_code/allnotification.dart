import 'package:flutter/material.dart';
class AllNotification extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AllNotificationState();
  }
  
}

class AllNotificationState extends State<AllNotification>{
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
    body: SingleChildScrollView(
      child: Container(
        height: size.height,
        width: size.width,
        color: Color(0xFFd6d6d6),
        child: Column(
          children: <Widget>[
            Card(
              child: Container(
                height: size.height/8,
                width: size.width,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Text("All Notifications"),
                  ],
                ),
              ),
            ),

            Card(
                child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("dfbfbdf"),
                    Icon(Icons.picture_as_pdf)
                  ],
                ),
              ),
            ),

            
          ],
        ),
        
      ),

    ),
      
    );
  }

}