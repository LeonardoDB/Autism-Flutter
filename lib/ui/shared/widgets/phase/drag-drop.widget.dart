import 'package:flutter/material.dart';

class DragDrop extends StatefulWidget {
  final String imagePlacePath;
  final Offset position;
  final String imageName;

  DragDrop({this.imagePlacePath, this.position, this.imageName});

  @override
  _DragDropState createState() => _DragDropState();
}

class _DragDropState extends State<DragDrop> {
  Offset pos;

  @override
  void initState() {
    pos = widget.position;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: pos.dy,
      left: pos.dx,
      child: Draggable(
        child: Image.asset(
          widget.imagePlacePath,
          width: 130,
          height: 130,
        ),
        data: widget.imageName,
        feedback: Opacity(
          opacity: 0.8,
          child: Image.asset(
            widget.imagePlacePath,
            width: 130,
            height: 130,
          ),
        ),
      ),
    );
  }
}
