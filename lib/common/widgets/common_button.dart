import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CommonButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: tabColor,
          minimumSize: const Size(double.infinity, 50),
        ),
        child:  Text(text , style:const TextStyle(
            color: Colors.black45
        ),),
    );
  }
}
