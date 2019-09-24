import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snbiz/Model_code/File_type.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class PreviewImage extends StatefulWidget {
  // final String imageFile;
  
  final String url;

  const PreviewImage({Key key, this.url}) : super(key: key);
  @override
  State createState() => PreviewImageState( url);
}

class PreviewImageState extends State<PreviewImage> {

   File imageFile;
  String url;
  PreviewImageState( this.url);
  List<Imagetype> _fileType = Imagetype.getFileType();
  List <DropdownMenuItem<Imagetype>> _dropdownMenuItems;
  Imagetype _file;
  
 @override
  void initState(){
   _dropdownMenuItems = buildDropdownMenuItems(_fileType);
    _file= _dropdownMenuItems[0].value;
    super.initState();
  }
  
  List<DropdownMenuItem<Imagetype>> buildDropdownMenuItems(List _fileType){
    List <DropdownMenuItem<Imagetype>> items = List();
    for (Imagetype imageType in _fileType){
      items.add(
        DropdownMenuItem(
          value: imageType,
          child: Text(imageType.fileType),
          ),
      );
    }
    return items;
  }
  onChangeDropdownItem(Imagetype file){
    setState(() {
     _file=file;
    });
  }

String _date ="Not set";
String issuedate="";
String expirydate="";
Callender(int a){
  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1),
                      maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                    print('confirm $date');
                    _date = '${date.year} - ${date.month} - ${date.day}';
                      if(a==0){
                            issuedate= _date;
                            }
                            else{
                                expirydate= _date;
                            }
                    setState(() {});
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 18.0,
                                  color: Colors.teal,
                                ),
                                Text(
                                  " $_date",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  Change",
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                color: Colors.white,
                );
}


  
    @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: (AppBar(title: Text('Image'))),
      body: SingleChildScrollView(
      child: Column(
      children: <Widget>[
        new Container (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[    
           
            Image.file(File(url), 
            width: size.width,
            height: size.height/4),
           
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
             Container(
               width: size.width,
               margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                children: <Widget>[
                  Padding(
                        padding: EdgeInsets.all(10),

                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      
                      Text(
                    'File Name',
                     style: TextStyle(color: Colors.black),
                     
                     ),
                     Container(
                       width: 150,
                       child: Material (
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                            decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(20.0,12.0,20.0,10.0),
                             enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.white, width: 3.0))
                            )
                          ),
                          ),

                     )
                    ]
                  ),
                  Padding(
                        padding: EdgeInsets.all(10),

                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                    Text(
                    'Issued Date',
                     style: TextStyle(color: Colors.black),
                     
                     ),

                        Container(
                          color: Colors.white,
                          height: 50,
                          width: 150,
                          child: Material (
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            child: Container(
                              child: Row(
                                children: <Widget>[
                            InkWell(
                            child: const Icon(
                            Icons.date_range,
                            color: Colors.blue,
                            ),
                            onTap: (){
                              Callender(0);
                            }
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                            ),
                          
                            Text(' $issuedate')
                              
                    ]
                              ),
                            ),
                            
                          ),
                        ),
                    ]
                   ),
                   Padding(
                        padding: EdgeInsets.all(10),

                      ),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                    Text(
                    'Expiry Date',
                     style: TextStyle(color: Colors.black),
                     
                     ),

                        Container(
                          height: 50,
                          width: 150,
                          
                          child: Material (
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            child: Container(
                              child: Row(
                                children: <Widget>[
                            InkWell(
                            child: const Icon(
                            Icons.date_range,
                            color: Colors.blue,
                            ),
                            onTap: (){
                              Callender(1);
                            }
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                            ),
                          
                            Text('$expirydate')
                              
                    ]
                              ),
                            ),
                            
                          ),
                        ),
                    ]
                        ),
                        Padding(
                        padding: EdgeInsets.all(10),

                      ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                  Text("Select file type"),
                  SizedBox(height: 20.0,
                  ),
                  Padding(
                      padding: EdgeInsets.all(5) ,
                  ),
                 DropdownButton(
                   value: _file,
                   items: _dropdownMenuItems,
                   onChanged: onChangeDropdownItem,
                 ),
                        ]
                  ),
                  Padding(
                        padding: EdgeInsets.all(5),

                      ),
             FloatingActionButton.extended(
              onPressed: (){
              }, 
              label: Text("Upload"),
             ),
             Padding(
               padding: EdgeInsets.only(bottom: 20),
             )
                ]  
      )
      
             )
             
          ]
          
        )
        
        )
      ]
      )
      )
      );
  }
}