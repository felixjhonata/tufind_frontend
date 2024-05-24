import 'package:flutter/material.dart';
import 'package:tufind_frontend/model/color.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isFill = true});
  final Function() onPressed;
  final String text;
  final bool isFill;

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle;
    Color fontColor;

    if (isFill) {
      fontColor = Colors.white;
      buttonStyle = ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(350, 50)),
        backgroundColor: MaterialStateProperty.all(lightBlue),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    } else {
      fontColor = lightBlue;
      buttonStyle = ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(350, 50)),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: lightBlue,
            ),
          ),
        ),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Text(
        text,
        style: TextStyle(
          color: fontColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
