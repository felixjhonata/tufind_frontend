import 'package:flutter/material.dart';
import 'package:tufind_frontend/model/color.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key, this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      top: 70,
      child: BackButton(
        onPressed: () {
          onPressed?.call();
          Navigator.pop(context);
        },
        color: darkBlue,
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size(70, 70)),
          iconSize: MaterialStateProperty.all(30),
          shadowColor: MaterialStateProperty.all(Colors.black),
          elevation: MaterialStateProperty.all(10),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            const CircleBorder(),
          ),
        ),
      ),
    );
  }
}
