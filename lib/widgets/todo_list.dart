import 'package:flutter/material.dart';
import 'package:hive_box_example/model/todo.dart';
import 'package:hive_box_example/widgets/add_todo.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: FutureBuilder(
          future: Hive.openBox('ToDoBox'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error.toString()}');
              } else {
                return WatchBoxBuilder(
                  box: Hive.box('ToDoBox'),
                  builder: (context, toDoBox) {
                    return toDoBox.length == 0
                        ? Center(
                            child: Text(
                              'No Data',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: toDoBox.length,
                            itemBuilder: (context, index) {
                              final toDoItem = toDoBox.getAt(index) as ToDo;
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AddToDo(
                                      index: index,
                                      isEdit: true,
                                      title: toDoItem.title,
                                      description: toDoItem.description,
                                    ),
                                  );
                                },
                                child: Card(
                                  elevation: 5,
                                  child: ListTile(
                                    leading: Text('${toDoItem.title}'),
                                    title: Text('${toDoItem.description}'),
                                    subtitle: Text(
                                        "${DateFormat('yyyy-MM-dd').format(toDoItem.time!)}"),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            Icons.refresh,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            print('refresh');
                                            // return toDoBox.putAt(
                                            //   index,
                                            //   ToDo('${contact.name}*', contact.age + 1),
                                            // );
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                          onPressed: () =>
                                              toDoBox.deleteAt(index),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                  },
                );
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
