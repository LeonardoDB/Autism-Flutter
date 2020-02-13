import 'package:flutter/material.dart';

class DragDrop extends StatefulWidget {
  final phase;

  DragDrop({this.phase});

  @override
  _DragDropState createState() => _DragDropState();
}

class _DragDropState extends State<DragDrop> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var imagePlaceDy = widget.phase['imagePlaceDy'].toDouble();
    var imagePlaceDx = widget.phase['imagePlaceDx'].toDouble();
    var imageWidth = widget.phase['imageWidth'].toDouble();
    var imageHeight = widget.phase['imageHeight'].toDouble();
    var imagePlacePath = widget.phase['imagePlacePath'];
    var imageName = widget.phase['imageName'].toString();

    return Positioned(
      top: imagePlaceDy,
      left: imagePlaceDx,
      child: Draggable(
        child: Image.asset(
          imagePlacePath,
          width: imageWidth,
          height: imageHeight,
        ),
        data: imageName,
        feedback: Opacity(
          opacity: 0.8,
          child: Image.asset(
            imagePlacePath,
            width: imageWidth,
            height: imageHeight,
          ),
        ),
      ),
    );

    // IMAGE BASE64
    // return Positioned(
    //     top: imagePlaceDy,r
    //     left: imagePlaceDx,
    //     child: Draggable(
    //       child: ImageBase64(
    //         base64String: imagePlacePath,
    //         imageWidth: imageWidth,
    //         imageHeight: imageHeight,
    //       ),
    //       data: imageName,
    //       feedback: Opacity(
    //         opacity: 0.8,
    //         child: ImageBase64(
    //           base64String: imagePlacePath,
    //           imageWidth: imageWidth,
    //           imageHeight: imageHeight,
    //         ),
    //       ),
    //     ),
    //   );
  }
}
