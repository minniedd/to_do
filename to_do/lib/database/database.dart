import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {

  List toDoList = [];

  final _myBox = Hive.box('myBox');

  void createInitialData() {
    toDoList = [
      ["Love RJ", false],
      ["Annoy Chimmy", false]
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}