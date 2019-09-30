import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("profile",
         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            backgroundColor: const Color(0xFF9C38FF),),
      
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          
              Container(
                //margin: EdgeInsets.all(1.0),
                height: size.height,
                width: size.width,
                child: Material(
                  color: Colors.white70,
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10.0),
                  shadowColor: Color(0x802196f3),
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Material(
                      color: Colors.white,
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(5.0),
                      shadowColor: Color(0x802196f3),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(60.0),
                              ),
                              CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 40.0),
                              ),
                              RaisedButton(
                                color: Colors.blue,
                                textColor: Colors.white,
                                padding: EdgeInsets.all(8.0),
                                splashColor: Colors.red,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0)),
                                onPressed: () {},
                                child: Text("Edit"),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 160.0),
                            child: Text(
                              'ORGANIZATION INFORMATION',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 195, top: 15.0),
                            child: Text(
                              'Organization Name',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 1.0),
                          ),
                          Container(
                            margin: EdgeInsets.all(20.0),
                            child: Material(
                              elevation: 5.0,
                              shadowColor: Colors.black,
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 12.0, 20.0, 10.0),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 3.0)))),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 195),
                            child: Text(
                              'VAT/PAN Number',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(20.0),
                            child: Material(
                              elevation: 5.0,
                              shadowColor: Colors.black,
                              child: TextField(
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 12.0, 20.0, 10.0),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 3.0)))),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 195),
                            child: Text(
                              'Organization Phone',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(20.0),
                            child: Material(
                              elevation: 5.0,
                              shadowColor: Colors.black,
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 12.0, 20.0, 10.0),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 3.0)))),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 195),
                            child: Text(
                              'Organization Email',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(20.0),
                            child: Material(
                              elevation: 5.0,
                              shadowColor: Colors.black,
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 12.0, 20.0, 10.0),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 3.0)))),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 235.0),
                            child: Text(
                              'Upload Logo',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 120.0,
                                height: 40.0,
                                margin: EdgeInsets.all(20.0),
                                child: Material(
                                  elevation: 5.0,
                                  shadowColor: Colors.black,
                                  child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          //border: OutlineInputBorder(),
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 12.0, 20.0, 10.0),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 3.0)))),
                                ),
                              ),
                              RaisedButton(
                                color: Colors.blue,
                                elevation: 5.0,
                                textColor: Colors.white,
                                padding: EdgeInsets.all(10.0),
                                splashColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0)),
                                onPressed: () {},
                                child: Text("Browse"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                              ),
                              RaisedButton(
                                elevation: 5.0,
                                color: Colors.blue,
                                textColor: Colors.white,
                                padding: EdgeInsets.all(10.0),
                                splashColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0)),
                                onPressed: () {},
                                child: Text("Upload"),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.0),
                          ),
                          RaisedButton(
                            elevation: 5.0,
                            color: Colors.blue,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(10.0),
                            splashColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0)),
                            onPressed: () {},
                            child: Text("Save"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
        ]
        ),
        
      
    );
  }
}
