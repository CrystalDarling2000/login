import 'package:login_vanguard/data.dart';
import 'package:login_vanguard/main.dart';

import 'patients.dart';
import 'data.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageUploaderWidget extends StatefulWidget {
  @override
  _ImageUploaderWidgetState createState() => _ImageUploaderWidgetState();
}

class _ImageUploaderWidgetState extends State<ImageUploaderWidget> {
  File? _selectedImage;

  Future<void> _getImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
      _uploadImageToFirebase();
    }
  }

  goBack() {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  Future<void> _uploadImageToFirebase() async {
    if (_selectedImage == null) return;

    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference storageReference =
        FirebaseStorage.instance.ref().child(fileName);
    final UploadTask uploadTask = storageReference.putFile(_selectedImage!);
    await uploadTask.whenComplete(() {
      print('done');
    });

    imageUrl = await storageReference.getDownloadURL();
    print('Image uploaded here it is: $imageUrl');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Uploader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_selectedImage != null) ...[
              Image.file(_selectedImage!),
              SizedBox(height: 16),
            ],
            ElevatedButton(
              onPressed: _getImageFromGallery,
              child: Text('Select Image'),
            ),
            ElevatedButton(
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }),
              child: Text('Go Back...'),
            ),
          ],
        ),
      ),
    );
  }
}
