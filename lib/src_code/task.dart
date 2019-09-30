import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TaskState();
  }
}

class TaskState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Task',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
        backgroundColor: const Color(0xFF9C38FF),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
