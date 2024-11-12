import 'package:flutter/material.dart';
import 'package:to_do/widgets/custom_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key, required this.controller,required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(104, 55, 37, 1),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(182, 122, 77, 1)),
                ),
                hintText: 'task',
                hintStyle: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(buttonText: 'Save', onPressed: onSave),
                const SizedBox(
                  width: 10,
                ),
                CustomButton(buttonText: 'Cancel', onPressed: onCancel)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
