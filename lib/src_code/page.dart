import 'package:flutter/material.dart';
import 'nav.dart';

import 'meeting.dart' as second;
import 'open_camera.dart' as third;
import 'profile.dart' as fourth;
import 'home.dart' as first;


class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return MainPageState();
  }

}

class MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
    TabController controller;
    @override
    void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 4,);

}

  @override

  void dispose(){
    controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Center(child: new Text("Kathmandu Codes"), 
      
        ),
        backgroundColor: const Color(0xFF9C38FF),

         actions: <Widget>[
            // action button
            IconButton(
              padding: const EdgeInsets.only(right: 30.0),
              icon: Icon(Icons.notifications, size: 30.0),
              onPressed: () {},
            ),

            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: CircleAvatar(
                
              ),
            )
                        ]
                      ),

                      drawer: Nav(),
                    
               
                                  body: new TabBarView(
                                    controller: controller,
                                    children: <Widget>[
                                      new first.Home(),
                                      new second.Meeting(),
                                      new third.CameraApp(),
                                      new fourth.Profile(),
                                      
                                    ],
                                  ),
              
                                  bottomNavigationBar: new Material(
                                    color: Color(0xFFBF9b38ff),

                                    child: Container(
                                      height: size.height/14,
                                      
                                      child: TabBar(
                                        
                                        controller: controller,
                                        tabs: <Tab>[

                                          new Tab(icon: new Icon(Icons.home, size: 18,), text:"Home",),
                                          new Tab(icon: new Icon(Icons.people,size: 18), text: "Meeting",),
                                          new Tab(icon: new Icon(Icons.camera_alt, size: 18), text: "Upload",),
                                          new Tab(icon: new Icon(Icons.person, size: 18,), text:"Profile",),
              
                                        ],
                                      ),
                                    ),
                                  ),
                            
                            
                                );
                                
                              }
              
              
                          }
