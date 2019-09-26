import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snbiz/Model_code/meetingsdetails.dart';
import 'package:snbiz/src_code/static.dart';
import 'package:http/http.dart' as http;

class MeetingDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MeetingDetailState();
  }

}
class MeetingDetailState extends State<MeetingDetail>{


Future<List<MeetingInfo>>_meeting()async{
  try{
  http.Response data = await http.get(
          Uri.encodeFull("https://s-nbiz.conveyor.cloud/api/OrgMeetings?Orgid=" + StaticValue.orgId.toString()), 
          headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json' 
      }
      );

  var jsonData = json.decode(data.body);
  List <MeetingInfo> meeting = [];
  for (var u in jsonData){
      var meetinginfo = MeetingInfo.fromJson(u);
    meeting.add(meetinginfo);
  }
print(meeting.length);
return meeting;
}
catch(e){
  print(e);
  return null;
}
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meeting Details"),
      ),
       body:Container(            
         child: FutureBuilder(
          future: _meeting(),
          builder:(BuildContext context, AsyncSnapshot snapshot){
          //  print(snapshot.data);
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int meetingId){
                  return ListTile(
                    title: Container(
                       width: 315.0,
                    height: 125.0,
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
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(snapshot.data[meetingId].meetingTime),
                            Text(snapshot.data[meetingId].location),
                            Text(snapshot.data[meetingId].statusName)
                          ],

                        ),
                    )
                  );
                }
              );
            }
         )
       )
       );

  }

}