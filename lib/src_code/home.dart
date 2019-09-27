import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  bool showIndicator = false;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    animation = Tween(begin: 5.0, end: 18.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

   final carousel2 = Carousel(
     
      boxFit: BoxFit.cover,
      animationCurve: Curves.fastOutSlowIn,
    animationDuration: Duration(milliseconds: 2000),
    dotSize: 2.0,
    dotIncreasedColor: Color(0xFFFFFFFF),
    dotBgColor: Colors.black.withOpacity(0.5),
    autoplayDuration: Duration(seconds: 5),
    images: [
      AssetImage('assets/image1.jpg',

      ),
      AssetImage('assets/image2.jpg'),
      AssetImage('assets/image3.jpg'),
      AssetImage('assets/image4.jpg'),
    ],
    // dotBgColor: Colors.white.withOpacity(1),
    
  );
   
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
  //  double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
        child:Container(
           color: Color(0xFFd6d6d6),
    //  height: size.height-62,
      //width: size.width,
     // color: Colors.grey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            //height: size.height/5 ,
           // color: Colors.white,
            child: Column(
              children: <Widget>[
                new Image(
                  image: new AssetImage("assets/logo.jpg"),
                  height: size.height /4.8,
                  width: size.width
                ),
                
               
              ],
            ),
          ),
          Container(
            //color: Colors.black,
           
            child: Wrap(
              children: <Widget>[
              Container(
              height: size.height/2.5,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
               // color: Colors.white,
                padding: EdgeInsets.fromLTRB(40,40,40,40),
                //color: Colors.black,
               // width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Image(
                              image: new AssetImage("assets/icon1.png"),
                              height: size.height/13,
                              
                              
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,5,0,5),
                              child: Text("Tasks"),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Image(
                              image: new AssetImage("assets/invoice.png"),
                              height: size.height/13,
                              
                              
                              

                            ),
                            
                            Padding(
                           padding: const EdgeInsets.fromLTRB(0,5,0,5),
                              child: Text("Invoice"),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Image(
                              image: new AssetImage("assets/Document.png"),
                              height: size.height/13,
                              
                            ),
                            Padding(
                       padding: const EdgeInsets.fromLTRB(0,5,0,5),
                              child: Text("Documents"),
                            )
                          ],
                        ),
                      ],
                    ),
                    
                    //  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      Divider(
                        color: Colors.grey,
                        height: 50.0,
                       

                      ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Column(
                          children: <Widget>[
                            Image(
                              image: new AssetImage("assets/icon5.png"),
                              height: size.height/13,
                              
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,5,0,5),
                              child: Text("Set Meetings"),
                            )
                          ],
                        ),

                        Column(
                          children: <Widget>[
                            Image(
                              image: new AssetImage("assets/icon3.png"),
                              height: size.height/13,
                              
                            ),
                            Padding(
                             padding: const EdgeInsets.fromLTRB(0,5,0,5),
                              child: Text("Upload documents"),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              
              ),
              ]
            ),
          ),
          GestureDetector(
                  onTap: (){},  // code hack do nothing
                  child: Wrap(
                    children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                     height: size.height/4.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0), 
                          child: carousel2
                    ),
                ),
        ],

      ),
    ),
        ]
      )
        ) 
    ),
    );
        
  }
}
