import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService{
  File _image;

   Future<File> getImageFromCamera()async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    _image = image;
    return _image;
  }
  Future<File> getImageFromGallery()async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _image = image;
    return _image;
  }

}