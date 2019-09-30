//import 'dart:developer';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:snbiz/src_code/filePreview.dart';
import 'package:snbiz/src_code/imagePreview.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter/services.dart';
//import 'package:multi_image_picker/asset.dart';
//import 'asset_view.dart';

class CameraApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CameraAppState();
  }
}

class CameraAppState extends State<CameraApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload"),
      ),

    );
  }
  //selecting an image from gallery is a async task as user can take as much time as they want
  List<Asset> images = List<Asset>();
  String _error;

  openGallery(BuildContext context) async {
    
    setState(() {
      images = List<Asset>();
    });

    List resultList;
    String error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 200,
        enableCamera: true,
      );
    } on PlatformException catch (e) {
      error = e.message;
    }
    if (!mounted) return;

    setState(() {
      images = resultList;
      if (error == null) _error = 'No Error Dectected';
    });
  }
    /*
    String image = await FilePicker.getFilePath(type: FileType.IMAGE);
    //imageFile = image;
    img = image;
    call();
  }
  */

  File imageFile;
  String img;

  openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    imageFile = picture;
    img = imageFile.path;
    call();
  }

  String filePath;
  void getFilePath() async {
    String _filePath = await FilePicker.getFilePath(type: FileType.ANY);
    filePath = _filePath;
    String _fileName;
    setState(() {
      _fileName = filePath != null ? filePath.split('/').last : '...';
    });
    callFile(_fileName);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              height: 350,
              width: 200,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(height: 150.0),
                      Container(
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(5.0)),
                          color: const Color(0xFF1500ff),
                        ),
                      ),
                      Positioned(
                        top: 50.0,
                        left: 94.0,
                        child: Container(
                          height: 90.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45.0),
                              border: Border.all(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 10.0),
                              image: DecorationImage(
                                  image: new AssetImage("assets/logo.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Make your choice!",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FloatingActionButton(
                            child: Icon(Icons.image),
                            onPressed: () {
                              openGallery(context);
                              Navigator.of(context).pop();
                            },
                          ),
                          FloatingActionButton(
                            child: Icon(Icons.camera_alt),
                            onPressed: () {
                              openCamera(context);
                              Navigator.of(context).pop();

                              // To close the dialog
                            },
                          ),
                          FloatingActionButton(
                            child: Icon(Icons.sd_storage),
                            onPressed: () {
                              getFilePath();
                              Navigator.of(context).pop();
                            },
                          ),
                        ]),
                  )
                ],
              ),
            ),
          );
        },
      );
    });
  }

  void call() {
    if (img.isNotEmpty) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PreviewImage(url: img)));
    }
  }

  void callFile(String filename) {
    if (filePath.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewFile(filePath: filename)));
    }
  }
}
