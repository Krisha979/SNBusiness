import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snbiz/Model_code/meetingsdetails.dart';
import 'package:snbiz/src_code/static.dart';
//import 'package:snbiz/Model_code/meetingsdetails.dart';
//import 'package:snbiz/Model_code/meetingsdetails.dart';
//import 'package:snbiz/src_code/createmeeting.dart';

class Meeting extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MeetingState();
  }

}

class MeetingState extends State<Meeting>{
Future<List<MeetingInfo>>_meeting()async{
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _meeting(),
          builder:(BuildContext context, AsyncSnapshot snapshot){

            print(snapshot.data);
            if(snapshot.data==null){
              return Container(
                child: Center(
                child: Text("Loading..."),
                )
              );
            }else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int meetingId){
                  return ListTile(
                    title:Text(snapshot.data[meetingId].fullName),
                    subtitle: Text(snapshot.data[meetingId].meetingTime),
                    //Text(snapshot.data[meetingId].agenda)
                  );
                },
              );
            }
              }
      )
      )
    );
 
}}
