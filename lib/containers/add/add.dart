import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/services/todo.dart';

import '../../helpers/validate.dart';
import '../../components/button/button.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({ Key? key }) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _loginForm = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  String previewImage = "";
  XFile? avatar;
  bool isCalling = false;

  submit() async {
    if (_loginForm.currentState!.validate()) {
      setState(() {
        this.isCalling = true;
      });

      TodoModel todo = await TodoService.add(_titleCtrl.text, _descriptionCtrl.text, avatar);
      print(todo.id);
    }
  }

  pickImage() async {
    final ImagePicker _picker = ImagePicker();    
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        this.avatar = image;
        this.previewImage = image.path;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          children: [
            Form(
              key: _loginForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _titleCtrl,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Name'
                      ),
                      validator: (value) => isRequired("Name", value)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _descriptionCtrl,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Description'
                      ),
                      maxLines: 8,
                      minLines: 5,
                      validator: (value) => isRequired("Description", value)
                    ),
                  ), 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(                      
                      onPressed: () => this.pickImage(),                      
                      child: Row(
                        children: [
                          Text(
                            "Select Image",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal                              
                            )
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 6.0),
                            child: const Icon(Icons.camera_alt_outlined, color: Colors.black87)
                          )
                        ]
                      )
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: 
                      previewImage != "" ? Image.file(
                        File(this.previewImage),
                      ) : Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Button(
                      title: 'Save',
                      isLoading: isCalling,
                      onPress: () => this.submit()
                    )
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}