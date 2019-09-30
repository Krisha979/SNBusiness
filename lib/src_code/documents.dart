import 'package:flutter/material.dart';

class Documents extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("All Documents",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
            backgroundColor: const Color(0xFF9C38FF),
        ),
      
    body: SingleChildScrollView(
      child: Container(
         height: size.height,
        width: size.width,
        color: Color(0xFFE0CECE),
      ),
    )
      
    );
  }

}