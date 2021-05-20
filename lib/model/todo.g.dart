// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoAdapter extends TypeAdapter<ToDo> {
  @override
  ToDo read(BinaryReader reader) {
    var obj = ToDo();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.title = reader.read() as String;
          break;
        case 1:
          obj.description = reader.read() as String;
          break;
        case 2:
          obj.time = reader.read() as DateTime;
          break;
        case 3:
          obj.status = reader.read() as bool;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, ToDo obj) {
    writer.writeByte(4);
    writer.writeByte(0);
    writer.write(obj.title);
    writer.writeByte(1);
    writer.write(obj.description);
    writer.writeByte(2);
    writer.write(obj.time);
    writer.writeByte(3);
    writer.write(obj.status);
  }
}
