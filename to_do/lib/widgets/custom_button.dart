import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  VoidCallback onPressed;
  CustomButton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    color: const Color.fromRGBO(182, 122, 77, 1),
    child: Text(buttonText,style: TextStyle(color: Colors.white),),
    );
  }
}