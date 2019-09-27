import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:snbiz/Model_code/model.dart';
import 'dart:convert';
import 'package:snbiz/src_code/page.dart';
import'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:connectivity/connectivity.dart';
import 'package:snbiz/src_code/static.dart';

class LoginPage extends StatefulWidget{
        @override
        State createState()=> new LoginPageState();
    }

    bool isLoading = false;
    

    class LoginPageState extends State<LoginPage> {

      final _formKey = GlobalKey<FormState>();
      final emailcontroller = TextEditingController();
      final passwordcontroller = TextEditingController();
      final storage = new FlutterSecureStorage();
      final _scaffoldKey = GlobalKey<ScaffoldState>();

      @override
      void initState() {
      super.initState();
      getfromstorage();
      }

      Future<Null> getfromstorage() async {
      var email = await storage.read(key:"Email");
      var password = await storage.read(key: "Password");
          if(email != null){
              emailcontroller.text = email;
            }
          if(password != null){
            passwordcontroller.text = password;
          }
          if(email!= null && password!=null){
             bool connection = await _checkConnectivity();
             if(connection == true){
              setState(() {
                           isLoading = true; 
                        });
            checkCredentials(email, password);
             }
          }
      }
  Future<void> checkCredentials(String email, String password) async{                 
      http.Response response = await http.get(
      Uri.encodeFull("https://s-nbiz.conveyor.cloud/api/UserAuthentication"),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "email": email,
        "password" : password
      }
      );
      if(response.statusCode == 200){
          print(response.body);
          Map data = await json.decode(response.body);
          var user = UserData.fromJson(data);
          if(user != null){
                if(user.isValidated){
                      StaticValue.orgId= user.organizationId;
                      StaticValue.orgName = user.organizationName;
                      StaticValue.logo = user.logo;
                      StaticValue.userRowstamp=user.userRowstamp;
                      await storage.write(key: "Email", value: email);
                      await storage.write(key: "Password", value: password);
                      setState(() {
                                      isLoading = false; 
                                  });
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                  }
                  else{
                    setState(() {
                                      isLoading = false; 
                                  });
                    await _alert(context, "Opps","You are not validated. Please Validate yourself.");
               }
          }
      }
      else if(response.statusCode == 401){
          setState(() {
                          isLoading = false; 
                      });
          await _alert(context, "Invalid Credentials","Email not found.");
      }
      else if(response.statusCode == 404){
            setState(() {
                            isLoading = false; 
                        });
            await _alert(context, "Invalid Credentials","Password did not match.");
         }
      else{
        setState(() {
                      isLoading = false; 
                  });
        await _alert(context, "Error","Server Error. Connection timed Out.");
        

      }
    }

      
      bool _obscureText = true;
      void _toggle() {
          setState(() {
             _obscureText = !_obscureText;
              }
          );
      }

      @override
      Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;
          return Scaffold(  
            key: _scaffoldKey,
            body: SingleChildScrollView(
              child: Container(
                width: size.width ,
                height: size.height,
                decoration:new BoxDecoration(
                  gradient: new LinearGradient(colors:[
                    const Color(0xFF1500ff),
                    const Color(0xFFA551F8),
                  ],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                  stops: [0.0,100.0],
                 ),
                ),
                      
               child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Image(
                            image: new AssetImage("assets/logo.jpg"),
                            height: 140.0,
                            width: 160.0,
                          ),

                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Text(
                         "SN Business Solutions", 
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 15.0
                            ),
                        ),

                        Text(
                          "Pvt. Ltd",
                          style: TextStyle(
                            fontWeight:FontWeight.w400,
                            color: Colors.white,
                            fontSize: 15.0
                          ),
                        ),
                            
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                              
                        Form(
                          key: _formKey,
                          child:  Wrap(
                            children:<Widget>[
                              new Container(
                                margin: EdgeInsets.all(5.0),
                                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
                                width: size.width * 0.85,
                                decoration: new BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: new BorderRadius.all(Radius.circular(10.0),)      
                                ),                                      
                                child: isLoading? Center(
                                  child: CircularProgressIndicator(
                                      strokeWidth: 4.0,
                                  ),
                                ):

                              new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(),
                              TextFormField(
                                controller: emailcontroller,
                                validator: (value) {
                                if (value.isEmpty) {
                                return 'Please enter some text';
                                }
                                if(!value.contains("@")){
                                return 'please enter valid email';
                                }
                                return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.lightBlue, 
                                    size: 20.0,
                                  ),   
                                ),
                              ),

                              SizedBox(),
                              TextFormField(
                                controller: passwordcontroller,
                                  validator: (value) {
                                if (value.isEmpty) {
                                return 'Please enter some text';
                                }
                              
                                return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: const Icon(Icons.lock, color: Colors.lightBlue, size: 20.0),
                                  suffixIcon: new GestureDetector(
                                    child: new FlatButton(
                                      onPressed: _toggle,
                                        child: new Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                                    ),
                                  )
                                ),
                                obscureText: _obscureText,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30.0),
                              ),
                              SizedBox(
                                child: FlatButton(
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.black,
                                  padding: EdgeInsets.all(9.0),
                                  splashColor: Colors.blueAccent,
                                  shape:RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  
                                  onPressed: () async {
                                      if (_formKey.currentState.validate())
                                       {
                                    
                                          bool connection = await _checkConnectivity();
                                          if(connection == true)
                                          {
                                              setState(() {
                                              isLoading = true; 
                                              });
                                              
                                              var useremail = emailcontroller.text;
                                              var password = passwordcontroller.text;
                                                try{
                                                    await storage.write(key: "Email", value: useremail);
                                                    await storage.write(key: "Password", value: password);
                                              }catch(e)
                                              {
                                                  print(e.toString());
                                              }
                                              await checkCredentials(useremail,password);
                                          }  
                                        }
                                   },
                                  child: Text("Sign in", 
                                  style: TextStyle(color: Colors.white)),
                               ),
                              ),   
                              ]
                              ),
                              ), 
                              ]  
                               ),
                               ),
                               ],
                               ),
                               ],
                               ),
                               ),
                               ),
                               ); 
                                    
                           }
                       
                       Future<bool> _checkConnectivity() async{
                        var result = await Connectivity().checkConnectivity();
                        if (result == ConnectivityResult.none){
                         _scaffoldKey.currentState.showSnackBar(
                          new SnackBar(
                            content: new Text('No Internet Access,Turn on Wifi or connect over mobile data'),
                            duration: Duration(seconds: 3),
                             backgroundColor: Color.fromARGB(80,255, 0, 0)
                          )
                         );
                         return false;
                        }else if (result == ConnectivityResult.mobile){
                        // _showDialog("Internet access","You are connected over mobile data");
                        _scaffoldKey.currentState.showSnackBar(
                          new SnackBar(
                            content: new Text('Internet Access, Connected over mobile data'),
                            duration: Duration(seconds: 3),
                             backgroundColor: Color.fromARGB(80,0, 255, 0)
                          )
                        );
                          return true;
                        }else if (result == ConnectivityResult.wifi){
                        // _showDialog("Internet access", "You are connected over wifi");
                        _scaffoldKey.currentState.showSnackBar(
                          new SnackBar(
                            content: new Text('Internet Access, Connected over Wifi'),
                            duration: Duration(seconds: 3),
                             backgroundColor: Color.fromARGB(80,0, 255, 0)
                          )
                          );
                          return true;
                          }
                          return false;
                        }
                        _showDialog(title, text) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(title),
                                content: Text(text),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Dismiss', style: TextStyle(color: Colors.blue, fontSize: 12.0),),
                                     onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            }
                          );
                        }
                      }
                      Future<void> _alert(BuildContext context, String header, String body) {
                          
                        return showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                        return AlertDialog(
                            title: Text(header),
                            content: Text(body),
                        
                                actions: <Widget>[
                          
                                  FlatButton(
                                          child: Text('Ok', style: TextStyle(color: Colors.blue, fontSize: 12.0)),
                                          
                                          onPressed: () {
                                                     Navigator.of(context).pop();
                                    },
                                  ),
                               ],
                             );
                            },
                          );
                        }
                        