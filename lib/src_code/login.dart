import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:snbiz/src_code/page.dart';
import'package:flutter_secure_storage/flutter_secure_storage.dart';


//import 'package:connectivity/connectivity.dart';




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

@override
voidinitState() {
super.initState();
getfromstorage();
 }

Future<Null> getfromstorage() async {
 var email = await storage.read(key:"Email");
 var password = await storage.read(key: "Password");
 if(email != null){
 emailcontroller.text = email;
 passwordcontroller.text = password;
 }
 }
  Future<dynamic> checkCredentials(String email, String password) async{
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
      return user;
      }
      else if(response.statusCode == 401){
      return false;
      }
      else if(response.statusCode == 404){
      return true;
      }
      else{
      return null;
      }
      }

      
      bool _obscureText = true;
      String _password;

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

                              Text
                                ("Pvt. Ltd",
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
                                        child: CircularProgressIndicator(),
                                      ):

                                         new Column(
                                                                         mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                                SizedBox(
                                                 
                                                  
                                                ),

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

                                                SizedBox(

                                                ),
                                                TextFormField(
                                                  controller: passwordcontroller,
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

                                                      setState(() {
                                                       isLoading = true; 
                                                      });


                                                      var useremail = emailcontroller.text;
                                                      var password = passwordcontroller.text;
                                                      var check = await checkCredentials(useremail,password);
                                                      if(check != null){
                                                         setState(() {
                                                       isLoading = false; 
                                                      });
                                                      if(check == true){
                                                      await _alert(context, "Invalid Credentials","Email not found.");
                                                      }

                                                      else if(check == false){
                                                      await _alert(context, "Invalid Credentials","Password did not match.");
                                                      }
                                                      else{
                                                      if(check.isValidated){
                                                      await storage.write(key: "Email", value: useremail);
                                                      await storage.write(key: "Password", value: password);
                                                      await _alert(context, "Congrats","You are validated.");
                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                                                      }
                                                      else{
                                                      await _alert(context, "Opps","You are not validated. Please Validate yourself.");
                                                      }
                                                      }
                                                      }
                                                      else{

                                                      await _alert(context, "Error","Server Error. Please check your internet connection.");
                                                       Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                                                      }
                                                     
                                                      },
                                                      

                                                                                                      
                                                    
                                                     child: Text("Sign in", 
                                                     
                                                     style: TextStyle(color: Colors.white)),
                                                     
                                                                                          
                                                   ),
                                                  ),    

                                                 ],
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
 child: Text('Ok'),
 onPressed: () {
   

      

 Navigator.of(context).pop();
 },
 ),
 ],
 );
 },
 );
}

                                
class UserData {
 int userAccountId;
 int organizationId;
 String password;
 String fullName;
 int userTypeId;
 String userRowstamp;
 bool isValidated;
 String email;
 String organizationEmail;
 String organizationName;
 String logo;
 String orgRowstamp;
                          

UserData(
 {this.userAccountId,
 this.organizationId,
 this.password,
 this.fullName,
 this.userTypeId,
 this.userRowstamp,
 this.isValidated,
 this.email,
 this.organizationEmail,
 this.organizationName,
 this.logo,
 this.orgRowstamp});
 
 UserData.fromJson(Map<String, dynamic> json) {
 userAccountId = json['userAccountId'];
 organizationId = json['organizationId'];
 password = json['password'];
 fullName = json['fullName'];
 userTypeId = json['userTypeId'];
 userRowstamp = json['userRowstamp'];
 isValidated = json['isValidated'];
 email = json['email'];
 organizationEmail = json['organizationEmail'];
 organizationName = json['organizationName'];
 logo = json['logo'];
 orgRowstamp = json['orgRowstamp'];
 }
 
 Map<String, dynamic> toJson() {
 final Map<String, dynamic> data = new Map<String, dynamic>();
 data['userAccountId'] = this.userAccountId;
 data['organizationId'] = this.organizationId;
 data['password'] = this.password;
 data['fullName'] = this.fullName;
 data['userTypeId'] = this.userTypeId;
 data['userRowstamp'] = this.userRowstamp;
 data['isValidated'] = this.isValidated;
 data['email'] = this.email;
 data['organizationEmail'] = this.organizationEmail;
 data['organizationName'] = this.organizationName;
 data['logo'] = this.logo;
 data['orgRowstamp'] = this.orgRowstamp;
 return data;
 }
}