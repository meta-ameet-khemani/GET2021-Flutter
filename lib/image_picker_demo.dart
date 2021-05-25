import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MyImagePicker extends StatelessWidget {
  File _image;

  Future _getImage() async {
    // final image = await ImagePicker.pickImage(source: ImageSource.camera);
    await ImagePicker.pickImage(source: ImageSource.camera);
    // setState(() {
    //   this._image = image;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              color: Colors.grey[200],
              child: Image.file(
                  new File('/storage/emulated/0/Download/forest.jpg')),
              alignment: Alignment.center,
            ),
            this._image == null
                ? Text(
                    'You have not selected any image',
                  )
                : Container(
                    width: 300,
                    height: 300,
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundImage: FileImage(this._image),
                    ), // Image.file(this._image),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getImage();
        },
        tooltip: 'Photo',
        child: Icon(Icons.camera),
      ),
      // new DecorationImage(
      //   image: FileImage(_image),
      //   fit: BoxFit.cover,
      // )
    );
  }
}
