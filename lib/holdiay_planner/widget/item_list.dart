import '../modal/list_item.dart';
import 'package:flutter/material.dart';

import '../screen/list_item_details.dart';

class ItemList extends StatefulWidget {
  final GlobalKey<AnimatedListState>? keys;
  final List<ListItem>? items;
  final Tween<Offset>? offset;

  ItemList({this.keys, this.items, this.offset});
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedList(
        key: widget.keys,
        initialItemCount: widget.items!.length,
        itemBuilder: (context, index, animation) {
          if (index < 5) {
            final listItem = widget.items![index];
            return SlideTransition(
              position: animation.drive(widget.offset!),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ListItemDetails(listItem),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Hero(
                    tag: listItem.imageURL!,
                    child: Card(
                      child: ListTile(
                        leading: Container(
                          width: 60,
                          height: 60,
                          child: ClipOval(
                            child: Image.asset(
                              listItem.imageURL!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          listItem.title!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(listItem.subTitle!),
                        trailing: Text(
                          listItem.ageLimit!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return SlideTransition(
              position: animation.drive(widget.offset!),
              child: GestureDetector(),
            );
          }
        },
      ),
    );
  }
}
