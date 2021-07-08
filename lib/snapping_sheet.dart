import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class SnappingSheetPlugin extends StatelessWidget {
  final ScrollController listViewController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      child: Container(
        color: Colors.grey[200],
        child: Placeholder(
          color: Colors.green[200]!,
        ),
      ),
      lockOverflowDrag: true,
      snappingPositions: [
        SnappingPosition.factor(
          positionFactor: 0.0,
          // snappingCurve: Curves.easeOutExpo,
          snappingDuration: Duration(seconds: 1),
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.factor(
          // snappingCurve: Curves.elasticOut,
          snappingDuration: Duration(milliseconds: 1750),
          positionFactor: 0.45,
        ),
        SnappingPosition.factor(
          grabbingContentOffset: GrabbingContentOffset.bottom,
          // snappingCurve: Curves.easeInExpo,
          snappingDuration: Duration(seconds: 1),
          positionFactor: 0.8,
        ),
      ],
      grabbing: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(blurRadius: 25, color: Colors.black.withOpacity(0.2)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 100,
              height: 7,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              color: Colors.grey[200],
              height: 2,
              margin: EdgeInsets.all(15).copyWith(top: 0, bottom: 0),
            )
          ],
        ),
      ),
      grabbingHeight: 75,
      sheetAbove: null,
      sheetBelow: SnappingSheetContent(
        draggable: true,
        childScrollController: listViewController,
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            controller: listViewController,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(15),
                color: Colors.green[200],
                height: 50,
                child: Center(
                  child: Text(index.toString()),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
