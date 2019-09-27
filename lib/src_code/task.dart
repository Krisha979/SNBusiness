import 'package:flutter/material.dart';
class TaskPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TaskState();
  }
  
}

class TaskState extends State<TaskPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Text("Task"),
      ),
    body: Text("Hello Task"),
      
    );
  }

}