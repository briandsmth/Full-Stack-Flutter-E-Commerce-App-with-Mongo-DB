import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String txt) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(txt),
    ),
  );
}

Future<List<File>> pickImage() async {
  List<File> images = [];

  try {
    var file = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (file != null && file.files.isNotEmpty) {
      for (var i = 0; i < file.files.length; i++) {
        images.add(File(file.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}
