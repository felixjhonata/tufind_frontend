import 'package:flutter/material.dart';
import 'package:tufind_frontend/model/color.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isFill = true,
    this.color = lightBlue,
  });
  final Function()? onPressed;
  final String text;
  final bool isFill;
  final Color color;

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle;
    Color fontColor;

    if (isFill) {
      fontColor = Colors.white;
      buttonStyle = ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(350, 50)),
        backgroundColor: MaterialStateProperty.all(color),
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
        surfaceTintColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: color,
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
