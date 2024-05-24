import 'package:flutter/material.dart';
import 'package:tufind_frontend/model/color.dart';

class MyPasswordField extends StatefulWidget {
  const MyPasswordField(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.controller,
      this.obscureText = false});

  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool obscureText;

  @override
  State<MyPasswordField> createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscured,
      controller: widget.controller,
      cursorColor: lightBlue,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
              icon: Icon(isObscured ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  isObscured = !isObscured;
                });
              }),
        ),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          widget.icon,
          color: lightBlue,
        ),
        hintText: widget.hintText,
        border: const OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red[900]!,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: darkBlue,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: lightBlue,
          ),
        ),
      ),
    );
  }
}
