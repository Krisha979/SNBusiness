import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snbiz/Model_code/meetingsdetails.dart';
import 'package:snbiz/src_code/createmeeting.dart';

class Meeting extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MeetingState();
  }

}

class MeetingState extends State<Meeting>{
Future<dynamic>fetchMeetingDetails() async{
  List<MeetingInfo> list = List();
  var isLoading = false;
 
 try {
 
BaseOptions options = new BaseOptions(

 baseUrl: "https://s-nbiz.conveyor.cloud/api",
 
connectTimeout: 10000,
 
receiveTimeout: 30000,

 headers: {

 'Content-type': 'application/json',
 
'Accept': 'application/json',
}

 );

 Dio dio = new Dio(options);
 
Response response = await dio.get("api/OrgMeetings?Orgid=");
 
print(response.data);
 
if(response.statusCode == 200){
 
list = (json.decode(response.body) as List)
          .map((data) => new MeetingInfo.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
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
 catch (e) {
print(e);
return null;
 }
 }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
 
     body: ListView(
       
      scrollDirection: Axis.vertical,
      children: <Widget>[

        Padding(
          padding: const EdgeInsets.all(0.0),
           child: Container(
            child: Material(
              color: Colors.white70,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(0.0),
              shadowColor: Color(0x802196f3),
        
          
               child: Column(
                
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[

                  
                       Container(
                         decoration: new BoxDecoration(
                        color: Colors.white,
                         borderRadius: new BorderRadius.circular(15.0),
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
                                Text("All Meetings"),
                                Text("148"),
                                Icon(Icons.file_upload),
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
                                  ),
                                  ),
                                onTap: (
                                ) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Create()));
                                },
                              ),
                            ),
                          )
                          ],
                        ),

                      ),
                     ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            contentPadding: EdgeInsets.all(10.0),
                            title: new Text(list[index].title),
                            trailing: new Image.network(
                            list[index].thumbnailUrl,
                            fit: BoxFit.cover,
                            height: 40.0,
                              width: 40.0,
                    ),
                  );
                }
                )
            )
                 ]
           )
        )
     )
     )
     )
                      
                      
                  
         
      ],
     )
            )
           )
        )
      ]
        )
     );
  }
}




Widget _buildAboutDialog(BuildContext context) {
  return AlertDialog(


    title: const Text("About"),
    content: new Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
    )
    );
}