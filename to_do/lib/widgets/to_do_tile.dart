import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunc;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.isCompleted,
      required this.onChanged,
      required this.deleteFunc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunc,
              icon: Icons.delete_sweep_rounded,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(20),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(104, 55, 37, 1),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Checkbox(
                  value: isCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.white,
                ),
                Text(
                  taskName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
