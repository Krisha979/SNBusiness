import 'package:flutter/material.dart';
import 'package:snbiz/src_code/page.dart';

class Nav extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>NavBar();
}
   
class NavBar extends State<Nav>{
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.purpleAccent,
                  Colors.deepPurple,
                ]
              )
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image(
                    image: new AssetImage("assets/logo.jpg"),
                    height: 80.0,
                    width: 140.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                   Text
                    ("SN Business Solutions",
                      style: TextStyle(
                      fontWeight:FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14.0
                       ),
                       ),
                     
                    Text
                    ("Pvt. Ltd",
                      style: TextStyle(
                      fontWeight:FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14.0
                         ),
                         ),

                   Padding(
                      padding: EdgeInsets.only(top: 8.0),

                    ),

                     ],
                     ),
                     ),
                     ),
                     Center(
                            child: Container(
                              margin: EdgeInsets.all(8.0),
                              color: Colors.blue,
                            child: Text(
                           "CustomerId:",
                           style: TextStyle(color: Colors.white),
                         ),
                         ),
                         ),
                     Container(
                      decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey.shade100))
                    ),
                       child: ListTile(
                         title: Row(
                           children: <Widget>[
                             
                             Icon(
                               Icons.home,
                               color: Colors.blue,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                              ),
                              Text('Home'),
                           ],
                          ),
                          onTap: (){
                           /* Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context) => MainPage()));*/
                              }
                        ),
                     ),
                     Container(
                        decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey.shade100))
                    ),

                     child:ListTile(
                       title: Row(
                         children: <Widget>[
                           Icon(
                             Icons.notifications,
                              color: Colors.red,
                             ),
                              Padding(
                              padding: EdgeInsets.only(left: 20),
                            ),
                          Text('Notifiaction'),
                         ],
                       ),
                       onTap: (){
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => MainPage()));
                            }
                     ),
                     ),

                     Container(
                        decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey.shade100))
                    ),
                                            child: ListTile(
                         title: Row(
                           children: <Widget>[
                             Icon(
                               Icons.format_list_bulleted,
                                color: Colors.pink,
                            ),
                             Padding(
                                padding: EdgeInsets.only(left: 20),
                              ),
                            Text('Invoices'),
                           ],
                         ),
                         onTap: (){
                           /* Navigator.push(
                              context, MaterialPageRoute(
                                builder: (context) => MainPage()));*/
                                }
                       ),
                     ),
                     
                      Container(
                         decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey.shade100))
                    ),
                                              child: ListTile(
                         title: Row(
                           children: <Widget>[
                             Icon(
                               Icons.filter_4,
                                color: Colors.purple,
                               ),
                                Padding(
                                padding: EdgeInsets.only(left: 20),
                              ),
                            Text('Summary'),
                           ],
                         ),
                         onTap: (){
                            /*Navigator.push(
                              context, MaterialPageRoute(
                                builder: (context) => MainPage()));*/
                                }
                     ),
                      ),
                     Container(
                        decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey.shade100))
                    ),
                                            child: ListTile(
                         title: Row(
                           children: <Widget>[
                             Icon(
                               Icons.directions_run
                               
                             ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                              ),
                            Text('logout'),
                           ],
                         ),
                         onTap: (){
                            /*Navigator.push(
                              context, MaterialPageRoute(
                                builder: (context) => MainPage()));*/ 
                         }
                       ),
                     ),
                  Container(
                  margin: EdgeInsets.only(right: 40),
                  ),
                    Row( 
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                              
                               Padding( 
                                padding: const EdgeInsets.fromLTRB(
                                  0.0,260.0, 30.0,20.0)),
                                InkWell(
                                   splashColor: Colors.red, 
                                  onTap: (
                                    

                                  ){
                                 
                                  },
                                      child: Image(
                                      image: new AssetImage("assets/facebook.png"),
                                      height: 30.0,
                                      width: 30.0,
                                        ),
                                 ),
                                 
                                 InkWell(
                                   splashColor: Colors.blue,
                                   onTap: (

                                   ){

                                   },
                                  child: Image(
                                     
                                      image: new AssetImage("assets/instagram.png"),
                                      height: 30.0,
                                      width: 30.0,
                                    
                                        ),
                                 ),
                                  InkWell(
                                     splashColor: Colors.blue,
                                    onTap: (){},
                                     child: Image(
                                      image: new AssetImage("assets/whatsapp.png"),
                                      height: 35.0,
                                      width: 35.0,
                                        ),
                                   ),
                                  
                                  InkWell(
                                    splashColor: Colors.red,
                                      child: Image(
                                      image: new AssetImage("assets/gmail.png"),
                                      height: 35.0,
                                      width: 35.0,
                                        ),
                                   ),


                           
                     ],
                     ),
        ]
      ),
                     );
                     }
                     }