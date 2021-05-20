import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_box_example/model/todo.dart';

class AddToDo extends StatelessWidget {
  static const routeName = 'add-todo';
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();
  bool isEdit = false;
  final String title;
  final String description;
  final int index;

  AddToDo({
    this.index,
    this.isEdit,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    if (this.isEdit != null && this.isEdit == true) {
      titleController.text = title;
      descriptionController.text = description;
    } else {
      this.isEdit = false;
    }

    return Dialog(
      child: Container(
        height: 250,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Go to market',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: TextField(
                    controller: descriptionController,
                    minLines: 2,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Buy x, y, z',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () async {
                    if (this.isEdit) {
                      final toDoBox = await Hive.box('ToDoBox');
                      toDoBox.putAt(
                        index,
                        ToDo(
                          title: titleController.text,
                          description: descriptionController.text,
                          status: false,
                          time: DateTime.now(),
                        ),
                      );
                    } else {
                      final box = await Hive.openBox('ToDoBox');
                      box.add(ToDo(
                        title: titleController.text,
                        description: descriptionController.text,
                        status: false,
                        time: new DateTime.now(),
                      ));
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                this.isEdit
                    ? RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
