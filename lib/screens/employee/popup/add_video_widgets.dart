// ignore_for_file: public_member_api_docs
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:join_re/lib/utils/service.dart';
import 'package:join_re/screens/employee/popup/add_video.dart';

class AddVideoWidgets extends StatefulWidget{

  final int id;
  const AddVideoWidgets({Key? key,  required this.id,}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _AddVideoWidgets();
  }
}

class _AddVideoWidgets extends State<AddVideoWidgets>{  // const MyApp({Key? key}) : super(key: key);
  Service service = Service();
  final _addFormKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  File? _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No video selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Video'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            child: Card(
                child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text('Video Title'),
                              TextFormField(
                                controller: _titleController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter Title',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter title';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                            child: OutlinedButton(
                                onPressed: getImage, child: _buildImage())),
                        Container(
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();

                                    var res = service.addImage(widget.id,'video','false', _image!.path);
                                    Navigator.pop(context);

                                    showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                    return AddVideo(id: widget.id,);
                                    }
                                    );

                                  }
                                },
                                child: Text('Save'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
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
