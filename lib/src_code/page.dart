import 'package:flutter/material.dart';
import 'nav.dart';

import 'meeting.dart' as third;
import 'open_camera.dart' as second;
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Center(child: new Text("Kathmandu Codes"), 
      
        ),
        backgroundColor: Colors.deepPurpleAccent,

         actions: <Widget>[
            // action button
            IconButton(
              padding: const EdgeInsets.only(right: 45.0),
              icon: Icon(Icons.notifications, size: 45.0),
              onPressed: (
                              ) {
                                
                              },
                            ),
                        ]
                      ),
                      drawer: NavBar(),
                    
               
                                  body: new TabBarView(
                                    controller: controller,
                                    children: <Widget>[
                                      new first.Home(),
                                      new second.CameraApp(),
                                      new third.Meeting(),
                                      new fourth.Profile(),
                                      
                                    ],
                                  ),
              
                                  bottomNavigationBar: new Material(
                                    color: Colors.deepPurpleAccent,
                                    child: TabBar(
                                      controller: controller,
                                      tabs: <Tab>[
                                        new Tab(icon: new Icon(Icons.home), text:"Home",),
                                        new Tab(icon: new Icon(Icons.camera_alt), text: "Upload",),
                                        new Tab(icon: new Icon(Icons.people), text: "Meeting",),
                                        new Tab(icon: new Icon(Icons.person), text:"Profile",),
              
                                      ],
                                    ),
                                  ),
                            
                            
                                );
                                
                              }
              
              
                          }
