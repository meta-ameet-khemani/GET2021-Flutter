import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class DismissibleWidget extends StatefulWidget {
  @override
  _DismissibleWidgetState createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {
  final List<ListItem> _items = List.generate(
    15,
    (index) => ListItem(
      name: 'Item Number ${index + 1}',
      key: Key(
        Random().nextInt(150).toString(),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        ListItem _item = _items[index];
        return Dismissible(
          onDismissed: (direction) {
            setState(() {
              if (direction == DismissDirection.startToEnd) {
                _items.add(
                  ListItem(
                    name: 'Item Number ${_items.length + 1}',
                    key: Key(
                      Random().nextInt(150).toString(),
                    ),
                  ),
                );
              } else {
                _items.removeAt(index);
              }
            });
          },
          key: UniqueKey(),
          secondaryBackground: Container(
            color: Colors.red,
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          background: Container(
            color: Colors.green,
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          child: ListTile(
            title: Text(_item.name),
          ),
        );
      },
    );
  }
}

class ListItem {
  final String name;
  final Key key;

  ListItem({this.name, this.key});
}
