import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:snbiz/Model_code/meetingsdetails.dart';
import 'package:snbiz/src_code/meeting.dart';

class MeetingDetail extends StatefulWidget {
  final MeetingInfo details;
  const MeetingDetail({Key key, this.details}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MeetingDetailState(this.details);
  }
}

class MeetingDetailState extends State<MeetingDetail> {
  final MeetingInfo details;
  MeetingDetailState(this.details);

  TextEditingController meetingTime;
  TextEditingController  meetingLocation;
  TextEditingController meetingAgenda;
  TextEditingController meetingDate;
  void editData(){


  }
  @override void initState() {
    meetingTime = new TextEditingController(text:details.meetingTime.toString());
    meetingLocation = new TextEditingController(text: details.location);
    meetingAgenda = new TextEditingController(text: details.agenda);

  }
 
 //time Picker
  TimeOfDay _time = new TimeOfDay.now();
  Future<Null> selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time) {
      print('Time Selected: ${_time.toString()}');
    }
  }
String _date ="";
  datePicker(){
  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1),
                      maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                    print('confirm $date');
                    _date = '${date.year} - ${date.month} - ${date.day}';
                    setState(() {});
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
} 
/*

  String _radioValue;
  String choice;
  @override
  void initState() {
    setState(() {
      _radioValue = "one";
    });
    super.initState();
  }

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'Accept':
          choice = value;
          break;
        case 'Decline':
          choice = value;
          break;
        case 'Cancel':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }
  */

  Future editpopup() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(" Meeting Time"),
                          InkWell(
                              child: Icon(Icons.timer),
                              onTap: (){selectTime(context);},
                              ),
                          SizedBox(),
                          TextFormField(
                            controller: meetingTime,
                            decoration: InputDecoration(
                                fillColor: Colors.white, filled: true),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(" Meeting Location"),
                          SizedBox(),
                          TextFormField(
                            controller: meetingLocation,
                            decoration: InputDecoration(
                                fillColor: Colors.white, filled: true),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(" Agenda"),
                          SizedBox(),
                          TextFormField(
                            controller: meetingAgenda,
                            decoration: InputDecoration(
                                fillColor: Colors.white, filled: true),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Date"),

                          SizedBox(),
                          InkWell(child: Icon(Icons.date_range),
                          onTap: (){datePicker();},),
                          Text(_date),
                        ],
                      ),
                      /*
                      Row(
                        children: <Widget>[
                          Text("Status"),
                          Row(
                            children: <Widget>[
                              Radio(
                                value: 'Accept',
                                groupValue: _radioValue,
                                onChanged: radioButtonChanges,
                              ),
                              Text(
                                "One selected",
                              ),
                            ],
                          ),
                        ],
                      ),
                      */
                      FlatButton(
                        color: Colors.blue,
                        child: Text("Update", 
                        style: TextStyle(
                          color: Colors.white
                        ),), 
                      onPressed: (){})
                    ],
                  ),
                ));
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
          actions: <Widget>[
            InkWell(
              onTap: () {
                editpopup();
              },
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
                    width: size.width,
                    height: size.height,
                    color: Colors.blue,
                    margin: EdgeInsets.all(10.0),
                    child: Column(children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Meeting Time"),
                          Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    new BoxShadow(
                                        color: Colors.black, blurRadius: 20.0)
                                  ]),
                              child: Text(details.meetingTime.toString())),
                        ],
                      ),
                       Row(
                        children: <Widget>[
                          Text("Meeting Date"),
                          Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    new BoxShadow(
                                        color: Colors.black, blurRadius: 20.0)
                                  ]),
                              //child: Text(details.meetingTime.toString())),
                           child: Text( DateFormat("dd-MM-yyyy").format(details.meetingTime)),
                           ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Meeting Location"),
                          Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    new BoxShadow(
                                        color: Colors.black, blurRadius: 20.0)
                                  ]),
                              child: Text(details.location.toString())),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Set Reminder"),
                          Container(
                            child: Row(children: <Widget>[
                              InkWell(
                                  child: const Icon(Icons.timer,
                                      color: Colors.green),
                                  onTap: () {
                                    selectTime(context);
                                  }),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                              ),
                              Text('Reminder Time: $_time')
                            ]),
                          ),
                        ],
                      ),
                    ])))));
  }
}
