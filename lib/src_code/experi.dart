/*import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snbiz/Model_code/meetingsdetails.dart';

class Meeting extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MeetingState();
  }

}

class MeetingState extends State <Meeting>{
  Dio dio;

final List<MeetingInfo> items =[];
 String url = "api/OrgMeetings?Orgid=KathmanduCo";
  ScrollController _scrollController = new ScrollController();
  bool isLoading = false;
   List meeting = new List();
BaseOptions baseOption = new BaseOption
  void _getMoreData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      final response = await dio.get(url);
      List meetings = new List();
      url = response.data['next'];
      for (int i = 0; response.data['results'].length; i++) {
        meetings.add(response.data['results'][i]);
      }

      setState(() {
        isLoading = false;
        meeting.addAll(meetings);
      });
    }
  }
  @override
  void initState() {
    this._getMoreData();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      //+1 for progressbar
      itemCount: meeting.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == meeting.length) {
          return _buildProgressIndicator();
        } else {
          return new ListTile(
            title: Text((meeting[index]['meeting'])),
            onTap: () {
              print(meeting[index]);
            },
          );
        }
      },
      controller: _scrollController,
    );
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagination"),
      ),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
  
}
*/