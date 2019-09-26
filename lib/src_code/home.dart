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
    dotSize: 4.0,
    dotIncreasedColor: Color(0xFFFFFFFF),
    dotBgColor: Colors.black.withOpacity(0.5),
    autoplayDuration: Duration(seconds: 5),
    images: [
      AssetImage('assets/image1.jpg'),
      AssetImage('assets/image2.jpg'),
      AssetImage('assets/image3.jpg'),
      AssetImage('assets/image4.jpg'),
    ],
    // dotBgColor: Colors.white.withOpacity(1),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
          onTap: () {},
          child: Container(
            width: size.width,
            height: size.height,
            color: Color(0xFFd6d6d6),
            child: Column(
              children: <Widget>[
                Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      // margin: EdgeInsets.fromLTRB(0.0, .0, 00.0, 0.0),
                      // height: size.height/6,
                      //width: size.width/0.5,
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          new Image(
                            image: new AssetImage("assets/logo.jpg"),
                            height: size.width / 2.8,
                            width: size.width,
                          ),
                          // Padding(
                          //   padding: EdgeInsets.fromLTRB(10, 5, 10, 7)
                          //),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "SN Business Solutions",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Wrap(children: <Widget>[
                    Container(
                      // height: size.height / 2.5,
                      margin: EdgeInsets.all(1.0),
                      padding: EdgeInsets.fromLTRB(5.0, 4.0, 5.0, 3.0),
                      child: Material(
                        color: Colors.white,
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(8.0),
                        shadowColor: Color(0x802196f3),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkWell(
                                  splashColor: Colors.red,
                                  child: Column(children: <Widget>[
                                    Wrap(children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: Image(
                                          image: new AssetImage(
                                              "assets/icon1.png"),
                                          height: size.height / 14,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ]),
                                    Padding(
                                      padding: EdgeInsets.only(top: 2.0),
                                    ),
                                    Text(
                                      "Tasks",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    ),
                                  ]),
                                  onTap: () {},
                                ),
                                InkWell(
                                  splashColor: Colors.red,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Image(
                                          image: new AssetImage(
                                              "assets/invoice.png"),
                                          height: size.height / 14,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                      ),
                                      Text(
                                        "Invoices",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  onTap: () {},
                                ),
                                InkWell(
                                  splashColor: Colors.red,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Image(
                                          image: new AssetImage(
                                              "assets/Document.png"),
                                          height: size.height / 14,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 18.0),
                                      ),
                                      Text(
                                        "Documents",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                            Center(
                              child: Divider(
                                color: Colors.grey,
                                //height: 30.0,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                  splashColor: Colors.red,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            110, 5, 10, 8),
                                        child: Image(
                                          image: new AssetImage(
                                              "assets/icon5.png"),
                                          height: size.height / 12.5,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            100, 15, 10, 15),
                                        child: Text(
                                          "Set Meetings",
                                          style: TextStyle(
                                              fontSize: 13, color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: () {},
                                ),
                                InkWell(
                                  splashColor: Colors.red,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            50, 6, 0, 10),
                                        child: Image(
                                          image: new AssetImage(
                                              "assets/icon3.png"),
                                          height: size.height / 14,
                                          fit: BoxFit.contain,
                                          //width: 50.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 20, 0, 13),
                                        child: Text(
                                          "Upload Documents",
                                          style: TextStyle(
                                              fontSize: 13, color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2),
                ),
                GestureDetector(
                    onTap: () {}, // code hack do nothing
                    child: Wrap(children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, 1, 0.0, 2),
                        height: size.height / 4.8,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: carousel2),
                      ),
                    ]))
              ],
            ),
          ),
        ),
      
    );
  }
}
