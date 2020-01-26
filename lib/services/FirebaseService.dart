import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';


class FirebaseService {
  static Future<String> uploadFile(File _image,String imageName,String userId) async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('${userId}')
        .child('$imageName');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    return await storageReference.getDownloadURL();
  }
}
