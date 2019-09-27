import 'package:flutter/material.dart';
class Setting extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SettingState();
  }
  
}

class SettingState extends State<Setting>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
    body: Text("Hello Notification"),
      
    );
  }

}