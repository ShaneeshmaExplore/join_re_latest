import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:join_re/lib/utils/service.dart';
import 'package:join_re/screens/employee/popup/add_photo.dart';
import 'package:join_re/screens/main_page.dart';
//import http package manually

class AddPhotoWidget extends StatefulWidget{

  final int id;
  final profile_img;
  const AddPhotoWidget({Key? key,  required this.id,this.profile_img}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _AddPhotoWidget();
  }
}

class _AddPhotoWidget extends State<AddPhotoWidget>{
  Service service = Service();
  final _addFormKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  File? _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Images'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            child: Center(
                child: Container(
                    child: Column(
                      children: <Widget>[

                        Container(
                            child: OutlinedButton(
                                onPressed: getImage,
                                child: _buildImage())),
                        Container(
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();

                                    var res = service.addImage(
                                        widget.id, 'image', widget.profile_img,
                                        _image!.path);
                                    Navigator.pop(context);
                                    if (widget.profile_img == "true") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainPage(pg: 3,
                                                  login: [
                                                    '',
                                                    widget.id
                                                  ],)),
                                      );
                                    }
                                    else {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AddPhoto(id: widget.id);
                                          }
                                      );
                                    }
                                  }
                                },
                                child: Text('Save'),

                              )
                            ],
                          ),
                        ),
                      ],
                    )
                )
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildImage() {
    if (_image == null) {
      return Padding(

        padding: EdgeInsets.all(5),
        child: Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Text(_image!.path);
    }
  }
}