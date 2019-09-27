import 'package:flutter/material.dart';
import 'package:snbiz/src_code/profile.dart';
import 'package:snbiz/src_code/static.dart';
import 'nav.dart';

import 'meeting.dart' as second;
import 'allnotification.dart' as third;
import 'setting.dart' as fourth;
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
        //centerTitle: true,
        title: Text(StaticValue.orgName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)), 
      
      
        backgroundColor: const Color(0xFF9C38FF),

         actions: <Widget>[
            // action button
            /*IconButton(
              padding: const EdgeInsets.only(right: 8.0),
              icon: Icon(Icons.notifications, size: 30.0),
              onPressed: () {},
            ),*/

            Padding(
              padding: const EdgeInsets.fromLTRB(0,10,15,10),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Profile()));
                },
                child: CircleAvatar(
               radius: 20,
               
                
              
               backgroundImage: NetworkImage(StaticValue.logo, ),
                
                  
                ),
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
                                      new third.AllNotification(),
                                      new fourth.Setting(),
                                      
                                    ],
                                  ),
              
                                  bottomNavigationBar: new Material(
                                    color: Color(0xFFBF9b38ff),

                                    
                                                         child:      Container(
                                        height: size.height/12,
                                        
                                        child: TabBar(
                                          
                                          controller: controller,
                                          tabs: <Tab>[

                                            new Tab(icon: new Icon(Icons.home, size: 16,), text:"Home",),
                                            new Tab(icon: new Icon(Icons.people,size: 16), text: "Meeting",),
                                            new Tab(icon: new Icon(Icons.notifications, size: 16), text: "Notification",),
                                            new Tab(icon: new Icon(Icons.settings, size: 16,), text:"Setting",),
              
                                          ],
                                        ),
                                      ),
                                    
                                    ),
    );
                                  
                                  
                            
                            
                                
                                
                              }
              
              
                          }
