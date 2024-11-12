import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/database/database.dart';
import 'package:to_do/widgets/dialog_box.dart';
import 'package:to_do/widgets/to_do_tile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    final _myBox = Hive.box('myBox');
    ToDoDataBase db = ToDoDataBase();

    @override
    void initState() {

      if (_myBox.get("TODOLIST") == null) {
        db.createInitialData();
      } else {
        db.loadData();
      }

      super.initState();
    }

    final _controller = TextEditingController();


  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTask() {
    showDialog(context: context, builder: (context) {
        return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),);
    });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(182, 122, 77, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "shookboy's tasks",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask,
      child: Image.asset('assets/shookboy.png'),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              taskName: db.toDoList[index][0],
              isCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunc: (context)=> deleteTask(index),
              );
        },
      ),
    );
  }
}
