import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


final String phpEndPoint = 'http://78.71.86.80/imageStorageAPI/upload.php';

File file;


class UploadScreen extends StatefulWidget {
  UploadScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<UploadScreen> {
  File tempFile;

  bool isLoading = false;

  void _choose() async {
    //file = await ImagePicker.pickImage(source: ImageSource.camera);
    file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      tempFile = file;
    });
  }

  void _upload() {
    if (file == null) return;
    String base64Image = base64Encode(file.readAsBytesSync());
    String fileName = file.path.split("/").last;

    setState(() {
      isLoading = true;
    });
  

    http.post(phpEndPoint, body: {
      "image": base64Image,
      "name": fileName,
    }).then((res) {
      print(res.body);
      setState(() {
      tempFile = null;
      file = null;

      setState(() {
      isLoading = false;
    });
    });
    }).catchError((err) {
      print(err);
    });


  }

  Widget checkIfLoading() {
    if (isLoading == true) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Center();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: _choose,
                child: Text('Choose Image'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: _upload,
                child: Text('Upload Image'),
              )
            ],
          ),
          checkIfLoading(),
          tempFile == null
            ? Text('No Image Selected') 
            : Image.file(tempFile)
        ],
      ),
    );
  }
}


