import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putBlob(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData(
      {required Uint8List file, required User currentUser}) async {
    String resp = "some error occurred";
    try {
      String imageurl = await uploadImageToStorage(
          currentUser.uid, file); // Using user's UID as the child name
      await _firestore.collection('users').doc(currentUser.uid).update({
        'imageLink': imageurl,
      });
      resp = 'success';
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}
