import 'package:flutter/material.dart';
//import 'menu.dart';
//import 'page.dart';

class Invoice extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
            backgroundColor: const Color(0xFF9C38FF),),
    

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
                    Text("All Invoices"),
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
    )
    );
  }

}

