import 'dart:io';

import 'package:image_picker/image_picker.dart';


pickImage(ImageSource source)async {
  final ImagePicker imgPicker = ImagePicker();

  XFile? file = await imgPicker.pickImage(source: source);

  if(file!=null){
    return File(file.path);
  }
  print("no file selected");
}