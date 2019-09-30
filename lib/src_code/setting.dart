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
       Size size = MediaQuery.of(context).size;
    return Scaffold(
      
   body: SingleChildScrollView(
     child: Container(
        height: size.height,
        width: size.width,
        color: Color(0xFFE0CECE),
     ),
   ),
      
    );
  }

}