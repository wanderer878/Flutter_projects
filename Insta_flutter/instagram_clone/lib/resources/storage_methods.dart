import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class StorageMethods {
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> UploadImgToStorage(
      String childName, Uint8List? file, bool isPost) async {
    Reference ref = _storage.ref(childName).child(_auth.currentUser!.uid);

    if(isPost){
      ref = ref.child(const Uuid().v1());
    }

    if (file == null) {
      final response = await http.get(Uri.parse(
          'https://images.unsplash.com/photo-1702966051138-009c0c965295?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHx8'));

      file = response.bodyBytes;
    }

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snapshot = await uploadTask;

    String download_url = await snapshot.ref.getDownloadURL();

    print(snapshot.ref);

    return download_url;
  }
}
