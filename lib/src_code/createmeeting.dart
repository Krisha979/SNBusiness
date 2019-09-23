import 'package:flutter/material.dart';

class Create extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Meetings"),
      ),
      body: ListView( 
       scrollDirection: Axis.vertical,
       children: <Widget>[
         

              Container(
                margin: EdgeInsets.all(15.0),
                height: 630.0,
                width:  320.0,
                  child: Material(
                    color: Colors.white,
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(5.0),
                    shadowColor: Color(0x802196f3),
                    child: Column(
                       children: <Widget>[
                      Padding(
                   padding: EdgeInsets.only(right:195, top: 40.0),
                  
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
                          child: Material (
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                            decoration: InputDecoration(
                           
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(20.0,30.0,20.0,10.0),
                             enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(5.0),
                             borderSide: BorderSide(color: Colors.white, width: 3.0))
                            )
                          ),
                          ),
                        ),

                  Padding(
                   padding: EdgeInsets.only(right:195),
                  
                      child: Text(
                    'VAT/PAN Number',
                     style: TextStyle(color: Colors.black),
                     
                     ),
                      ),
                        Container(
                          margin: EdgeInsets.all(20.0),
                          child: Material (
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            child: TextField(
                            decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(20.0,30.0,20.0,10.0),
                           enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.white, width: 3.0))
                            )
                          ),
                          ),
                        ),
                         Padding(
                   padding: EdgeInsets.only(right:195),
                  
                      child: Text(
                    'Organization Phone',
                     style: TextStyle(color: Colors.black),
                     
                     ),
                      ),
                     
                        Container(
                          
                          margin: EdgeInsets.all(20.0),
                          child: Material (
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                            decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                          contentPadding: EdgeInsets.fromLTRB(20.0,30.0,20.0,10.0),
                           enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.white, width: 3.0))
                            )
                          ),
                          ),
                        ),
                         Padding(
                       padding: EdgeInsets.only(right:195),
                  
                      child: Text(
                    'Organization Email',
                     style: TextStyle(color: Colors.black),
                     
                     ),
                      ),
                        Container(
                          margin: EdgeInsets.all(20.0),
                          child: Material (
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                            decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(20.0,30.0,20.0,10.0),
                             enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.white, width: 3.0))
                            )
                          ),
                          ),
                        ), 
                               
                      Padding(
                               padding: EdgeInsets.only(top:3.0),
                              ),
                                 RaisedButton(
                                   elevation: 5.0,
                                   color: Colors.blue,
                                   textColor: Colors.white,
                                   padding: EdgeInsets.all(10.0),
                                   splashColor: Colors.red,
                                   shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(3.0)
                                     ),
                                    onPressed: (){},
                                    child: Text("Create"),
                                  ),    

                    
                    
                              ],
                          ),
                  ),

                          

        ),
       ],
           ),
        
      
       
       
       
    
    );

  }

}