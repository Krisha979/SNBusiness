import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:snbiz/Model_code/meetingsdetails.dart';
import 'package:snbiz/src_code/meeting.dart';

class MeetingDetail extends StatefulWidget{
  final MeetingInfo details;
  const MeetingDetail({Key key, this.details}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MeetingDetailState(this.details);
  }
  
}

class MeetingDetailState extends State<MeetingDetail>{
  
  final MeetingInfo details;
  MeetingDetailState(this.details);
 
  String _time ="";

  time(){
         DatePicker.showTimePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true, 
                      onConfirm: (time) {
                    print('confirm $time');
                    _time = '${time.hour} : ${time.minute}';
                    setState(() {});
                  }, 
                  currentTime: DateTime.now(), locale: LocaleType.en);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Details"),
      actions: <Widget>[
         Icon(
      Icons.edit,
      color: Colors.white,
      size: 30.0,
    ),
      ],
      ),
      body: SingleChildScrollView(
      child:Center(
      child: Container(
        width: size.width,
        height: size.height,
        color: Colors.blue,
        margin: EdgeInsets.all(10.0),
        child: Column(
        children: <Widget>[
          Center(
                      child: Container(
                        margin: EdgeInsets.all(30),
              width: size.width,
              /*     decoration: new BoxDecoration(
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
                       */
                       child: Column(
        children: <Widget>[

         Container(
           child:TextFormField(
             decoration: InputDecoration(
                fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(20.0,12.0,20.0,10.0),
                             labelText: ('Meeting ID: '+details.meetingId.toString()),
                             enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.white, width: 3.0))
             )
             )),
         Text('Meeting Location: '+ details.location),
         Container(
                color: Colors.white,
                child: Material (
                elevation: 5.0,
                shadowColor: Colors.black,
                child: Container(
                child: Row(
                    children: <Widget>[
                      InkWell(
                        child: const Icon(
                          Icons.timer,
                          color: Colors.green
                            ),
                          onTap: (){
                          time();
                              }
                              ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          ), 
                    Text('Set Time:  $_time')
                                  ]
                                ),
                              ),
                              
                            ),
                          ), 
                          Text('Agenda'+details.agenda),
                          Text ('Meeting Time'+details.meetingTime.toString())       
         
        ]
        )
            ),
          )
        ]
       )
       )
      )
      )
    );
  }}

  