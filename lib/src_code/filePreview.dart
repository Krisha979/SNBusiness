
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:snbiz/Model_code/File_type.dart';


class PreviewFile extends StatefulWidget {
  // final String imageFile;
   final String filePath;
  const PreviewFile({Key key, this.filePath}) : super(key: key);
  @override
  State createState() => PreviewFileState(filePath);
}


class PreviewFileState extends State<PreviewFile> {

final filename = TextEditingController();
bool _validate = false;


  String filePath;
  PreviewFileState(this.filePath);
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
callender(int a){
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
} 
    @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: (AppBar(title: Text('Image'),
      backgroundColor: const Color(0xFF1500ff))),
      body: SingleChildScrollView(
      child: Column(
      children: <Widget>[
        
        new Container (
          margin: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[    
                        Container(
                      
                      width: size.width,
                      height: size.height/5,
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
                         mainAxisAlignment: MainAxisAlignment.start,
                children: [
                       Container(
                         
                         margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                         width: size.width,
                         height: size.height/15,
                         decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.only(topRight:Radius.circular(15.0), 
                        topLeft: Radius.circular(15.0)),
                           color: const Color(0xFF1500ff),
                         ),
                       ),
                      
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          Image(
                          image: new AssetImage("assets/docicon.png",),
                          height: 60),
                         Flexible(
                         child: Text( filePath, 
                          textAlign: TextAlign.center, 
                          style:TextStyle(
                          color: Colors.black,
                          fontFamily: 'Amagh_Demo',
                          fontSize: 14,
                        ),
                        ),
                         ),
                        ]
                       ),
                        ]
                       ), 
                     
                          ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            
             Container(
               width: size.width,
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
                      Flexible(
                     child: Text(
                    'File Name',
                     style: TextStyle(color: Colors.black),
                     
                     ),
                      ),
                     Container(
                       width: 180,
                       child: Material (
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              controller: filename,
                            decoration: InputDecoration(
                              errorText: _validate ? 'Enter the file name' : null,
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
                          width: 180,
                          child: Material (
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            child: Container(
                              child: Row(
                                children: <Widget>[
                            InkWell(
                            child: const Icon(
                            Icons.date_range,
                            color: Colors.green
                            ),
                            onTap: (){
                              callender(0);
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
                          width: 180,
                          child: Material (
                            elevation: 5.0,
                            shadowColor: Colors.black,
                            child: Container(
                              child: Row(
                                children: <Widget>[
                            InkWell(
                            child: const Icon(
                            Icons.date_range,
                            color: Colors.green,
                            ),
                            onTap: (){
                              callender(1);
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
                setState(() {
                 filename.text.isEmpty ? _validate = true : _validate = false;
                 if ('$issuedate'.isEmpty){
                   alert();
                 }
                 if ('$expirydate'.isEmpty){
                   alert();

                 }
                });
              }, 
              label: Text("Upload"),
              backgroundColor: const Color(0xFF1500ff),
              
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
  void alert(){
    showDialog(
            context: context,
             builder: (BuildContext context){
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(15.0)
                  ),
              child: Container(
                   margin: EdgeInsets.all(20),
                    child:Text("Please fill the empty textfield!",
                    style: TextStyle(color: Colors.red),
                )
              ),
              );
             }
    );
  }
}

