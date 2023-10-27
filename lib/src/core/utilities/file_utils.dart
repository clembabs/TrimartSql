import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sql_app/src/core/constants/app_colors.dart';

class FileUtils {
  static Future<Uint8List?> getXFile(
    ImageSource source, {
    CameraDevice device = CameraDevice.rear,
    bool crop = true,
  }) async {
    final image = await ImagePicker().pickImage(
      source: source,
      preferredCameraDevice: device,
      maxHeight: 300.h,
      maxWidth: 300.w,
    );

    if (image == null) return null;

    if (!crop) return encodeImage(File(image.path));

    final croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        compressFormat: ImageCompressFormat.jpg,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarColor: Colors.white,
            toolbarTitle: 'Crop image',
            statusBarColor: AppColors.primaryColor,
            backgroundColor: Colors.black,
          )
        ]);

    if (croppedFile == null) return null;
    final Uint8List result = encodeImage(File(croppedFile.path));
    return result;
  }

  static Uint8List encodeImage(File imageFile) {
    final bytes = imageFile.readAsBytesSync();
    final image = img.decodeImage(bytes);
    final resizedImage = img.copyResize(image!, width: 200, height: 200);
    return Uint8List.fromList(img.encodePng(resizedImage));
  }
}
