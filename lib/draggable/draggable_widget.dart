import 'package:flutter/material.dart';

class DraggableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      child: buildContainer('Original', Colors.red),
      feedback: Material(child: buildContainer('Dragged', Colors.green)),
      childWhenDragging:
          Material(child: buildContainer('Child When Dragging', Colors.purple)),
    );
  }

  Container buildContainer(String title, Color color) {
    return Container(
      width: 160,
      height: 100,
      color: color,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 32,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
