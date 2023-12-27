import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker pick = ImagePicker();
  XFile? file = await pick.pickImage(source: source);

  if (file != null) {
    return await file.readAsBytes();
  }
}

showSnackbar(String content, BuildContext context) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(SnackBar(content: Text(content)));
}
