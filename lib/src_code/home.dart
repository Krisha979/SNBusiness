import 'package:flutter/material.dart';
import 'package:snbiz/src_code/meeting.dart';
import 'package:snbiz/src_code/allnotification.dart';
import 'package:snbiz/src_code/documents.dart';


 Function onTap;
class Home extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
          splashColor: Colors.greenAccent,
          onTap: (){},
          child: Wrap(
                  children:<Widget>[
                   Container(
                     margin: EdgeInsets.all(2.0),
                      child: Material(
                      color: Colors.white70,
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(8.0),
                      shadowColor: Color(0x802196f3),
                
                      child: Column(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                        ListTile(
                          
                            onTap: ( ){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Documents()));
                              
                            
                            },
                          
                            title:Wrap(
                                   children:<Widget>[
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 20.0),
                                      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0), 
                                                 
                                  
                                      decoration: new BoxDecoration(
                                      color: Colors.white,
                                    
                                      borderRadius: new BorderRadius.circular(10.0),
                                      boxShadow: [
                                      BoxShadow(
                                                blurRadius: 4.0,
                                                color: Colors.black.withOpacity(0.5),
                                                offset: Offset(0.5, 0.5),
                                              ),
                                            ],
                                      ),
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                              
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text("All Documennts"),
                                            Text("148"),
                                            Icon(Icons.access_time),
                                            Text("17th august 2019"),

                                          ],

                                        ),
                                        ClipOval(
                                        child: Material(
                                          color: Colors.blue, // button color
                                          child: InkWell(
                                            splashColor: Colors.red, // inkwell color
                                            child: SizedBox(width: 56, height: 56,
                                            child: Icon(
                                              Icons.picture_as_pdf,
                                              color: Colors.white,
                                              )),
                                            onTap: () {},
                                          ),
                                        ),
                                    )
                           
                                  ],
                                ),

                              ),
                              ],
                            ),
                            ),




                   ListTile(
                      onTap: ( ){
                       // Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => new Meeting()));
                      },
                    
                    title:Wrap(
                             children:<Widget>[
                             Container(
                                 padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 20.0),
                                 margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0), 
        
                                  decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.circular(10.0),
                                  boxShadow: [
                                  BoxShadow(
                                          blurRadius: 4.0,
                                          color: Colors.black.withOpacity(0.5),
                                          offset: Offset(0.5, 0.5),
                                        ),
                                      ],
                                  ),
                        
                        


                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text("All Meetings"),
                                Text("148"),
                                Icon(Icons.arrow_downward),
                                Text("17th august 2019"),

                              ],

                            ),
                            
                            ClipOval(
                              child: Material(
                                color: Colors.green, // button color
                                child: InkWell(
                                  splashColor: Colors.red, // inkwell color
                                  child: SizedBox(width: 56, height: 56,
                                   child: Icon(
                                     Icons.picture_as_pdf,
                                     color: Colors.white,
                                     ),
                                  
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            )
                          ],

                          
                        ),
                        
                      ),
                             ]
                    ),
                   ),
                    
                    
                    Wrap(
                       children:<Widget>[
                       ListTile( 
                        onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AllNotification()));
                        },
                        title: Container(
                             padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 25.0),
                             margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0), 
                        // width: 350.0,
                          //height: 120.0,
                           decoration: new BoxDecoration(
                           color: Colors.white,
                           borderRadius: new BorderRadius.circular(10.0),
                           boxShadow: [
                           BoxShadow(
                                  blurRadius: 4.0,
                                  color: Colors.black.withOpacity(0.5),
                                  offset: Offset(0.5, 0.5),
                                ),
                              ],
                           ),
                           child: new Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text("All Notifications"),
                                  Text("148"),
                                  Icon(Icons.history),
                                  Text("17th august 2019"),

                                ],

                              ),
                          
                               ClipOval(
                                child: Material(
                                  color: Colors.deepOrange, // button color
                                  child: InkWell(
                                    splashColor: Colors.red, // inkwell color
                                    child: SizedBox(width: 56, height: 56,
                                     child: Icon(
                                       Icons.notifications,
                                       color: Colors.white,
                                       ))
                                  ),
                                ),
                              )
                            ],
                          ),

                        ),
                       
                      ),
                     ],
                    ),
                    
                    
                     Wrap(
                        children:<Widget>[
                         ListTile(
                        onTap: ( ){ 
                          Navigator.pop(context);

                        },
                     title:Container(
                       // width: 350.0,
                        //height: 120.0,
                          padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 25.0),
                           margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0), 
                         decoration: new BoxDecoration(
                         color: Colors.white,
                         borderRadius: new BorderRadius.circular(10.0),
                         boxShadow: [
                         BoxShadow(
                                blurRadius: 4.0,
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0.5, 0.5),
                              ),
                            ],
                         ),
                         child: new Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text("All Invoices"),
                                Text("148"),
                                Icon(Icons.arrow_downward),
                                Text("17th august 2019"),

                              ],

                            ),
                    
                             ClipOval(
                              child: Material(
                                color: Colors.redAccent, // button color
                                child: InkWell(
                                  splashColor: Colors.red, // inkwell color
                                  child: SizedBox(width: 56, height: 56,
                                   child: Icon(
                                     Icons.filter_3,
                                     color: Colors.white,
                                     ),
                                  
                                ),
                              ),
                            )
                             ),
                          ],

                    ),
                       ),
                       ),
                                            ],
                     ),
                  ],
              ),

            ),
            ),
                      ],
          )
        ),
        ),
      ],
    );

  }
}
  


  