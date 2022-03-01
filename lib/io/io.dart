import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
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

Future<bool> saveNftCard(
    GlobalKey key, String fileName, String platform) async {
  // TODO: Add timestamp to the png file

  Directory? directory;
  RenderRepaintBoundary boundary =
      key.currentContext!.findRenderObject() as RenderRepaintBoundary;

  //Create image data
  var image = await boundary.toImage();
  ByteData byteData =
      await image.toByteData(format: ImageByteFormat.png) as ByteData;
  Uint8List pngBytes = byteData.buffer.asUint8List();

  try {
    //Create the path to the file on Android
    if (platform == PlatformInfo.android) {
      if (await requestPermission(Permission.storage) &&
          await requestPermission(Permission.accessMediaLocation)) {
        directory = await getExternalStorageDirectory() as Directory;
        String newPath = '';

        List<String> folders = directory.path.split('/');
        for (int i = 1; i < folders.length; i++) {
          String folder = folders[i];
          if (folder != 'Android') {
            newPath += '/' + folder;
          } else {
            break;
          }
        }
        newPath = newPath + '/wcdonalds';
        directory = Directory(newPath);
      } else {
        return false;
      }
      //Save image on iOS
    } else if (platform == PlatformInfo.macOs) {
      if (await requestPermission(Permission.photos)) {
        ImageGallerySaver.saveImage(
          pngBytes,
          name: fileName,
          isReturnImagePathOfIOS: true,
        );
      } else {
        return false;
      }
    }
    //Check if directory exists. If not create the new one
    if (!await directory!.exists()) {
      await directory.create(recursive: true);
    }
    //Save file
    if (await directory.exists()) {
      File file = File(directory.path + '/$fileName.png');

      await file.writeAsBytes(pngBytes);

      return true;
    }
  } catch (e) {
    print('saveNftCard() error: $e');
  }

  return false;
}
