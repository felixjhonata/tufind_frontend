import 'package:flutter/material.dart';

class TogglePassButton extends IconButton {
  TogglePassButton(
      {super.key, required bool isObscured, required Function() onPressed})
      : super(
          icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
          onPressed: onPressed,
        );
}
