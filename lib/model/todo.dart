import 'package:hive/hive.dart';

part 'todo.g.dart';

// @HiveType(adapterName: 'ToDoAdapter')
@HiveType(typeId: 0)
class ToDo {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  DateTime? time;
  @HiveField(3)
  bool? status;

  ToDo({
    required this.title,
    required this.description,
    required this.time,
    required this.status,
  });
}