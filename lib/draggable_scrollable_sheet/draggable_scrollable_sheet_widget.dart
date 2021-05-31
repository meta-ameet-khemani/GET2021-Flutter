import 'package:flutter/material.dart';

class DraggableScrollableSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
      child: DraggableScrollableSheet(
        initialChildSize: 0.3,
        maxChildSize: 0.8,
        minChildSize: 0.2,
        expand: true,
        builder: (context, scrollController) {
          return Container(
            color: Colors.orangeAccent,
            child: ListView.builder(
              controller: scrollController,
              itemCount: 25,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'List Tile Number: ${index + 1}',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
