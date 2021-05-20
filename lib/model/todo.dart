import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(adapterName: 'ToDoAdapter')
class ToDo {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  DateTime time;
  @HiveField(3)
  bool status;

  ToDo({this.title, this.description, this.time, this.status});
}
