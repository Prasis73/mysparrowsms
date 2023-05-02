// ignore_for_file: implementation_imports

import 'dart:io';

import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class GalleryUtils {
  static Future<File?> getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final response =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 20,);
    if (response != null) {
      return File(response.path);
    }
    return null;
  }
}

class ImageUtils {
  static Future<File?> getImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    final response =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 20);
    if (response != null) {
      return File(response.path);
    }
    return null;
  }
}
