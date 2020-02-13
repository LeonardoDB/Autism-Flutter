import 'package:flutter/material.dart';
import 'dart:convert';

class ImageBase64 extends StatelessWidget {
  final String base64String;
  var imageWidth;
  var imageHeight;

  ImageBase64({
    @required this.base64String,
    @required this.imageWidth,
    @required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      base64Decode(base64String),
      width: imageWidth,
      height: imageHeight,
    );
  }
}
