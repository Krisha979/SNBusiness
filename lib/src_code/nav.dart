import 'package:flutter/material.dart';
import 'menu.dart';


class NavBar extends StatelessWidget{
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
                          ]
                      )
                      ,
                    
                    ),
              ),

              
              
              
             
                          CustomListTile(Icons.home, 'Home',  (){
                            
                           

                            
                        
                          }),
                          CustomListTile(Icons.notifications, 'Notification', () =>{
                            
                          }),
                          CustomListTile(
                            Icons.format_list_bulleted, 'Invoices', () =>{}),

                          CustomListTile(Icons.filter_4, 'Summary', () =>{}),
                          CustomListTile(Icons.directions_run, 'Logout', () =>{}),






                          Container(
                           margin: EdgeInsets.only(right: 40),
                           
                            
                           child: Row( 
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
                         ),
                     ],
                ),
      );
      
    
  }

}
