import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/platform.dart';

Future<bool> requestPermission(Permission permission) async {
  if (await permission.isGranted) {
    return true;
  } else {
    final result = await permission.request();
    if (result == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }
}

Future<void> saveNftCard(
    GlobalKey key, String fileName, String platform) async {
  RenderRepaintBoundary boundary =
      key.currentContext!.findRenderObject() as RenderRepaintBoundary;

  //Create image data
  var image = await boundary.toImage();
  ByteData byteData =
      await image.toByteData(format: ImageByteFormat.png) as ByteData;
  Uint8List pngBytes = byteData.buffer.asUint8List();

  if (platform == PlatformInfo.android) {
    if (await requestPermission(Permission.storage) &&
        await requestPermission(Permission.accessMediaLocation)) {
      await ImageGallerySaver.saveImage(
        pngBytes,
        quality: 100,
        name: fileName,
      );

      return;
    } else {
      throw Exception('Failed to get permission');
    }
    //Save image on iOS
  } else if (platform == PlatformInfo.macOs) {
    if (await requestPermission(Permission.photos)) {
      ImageGallerySaver.saveImage(
        pngBytes,
        name: fileName,
        isReturnImagePathOfIOS: true,
      );
      return;
    } else {
      throw Exception('Failed to get permission');
    }
  }

  throw Exception('Failed to save image');
}
