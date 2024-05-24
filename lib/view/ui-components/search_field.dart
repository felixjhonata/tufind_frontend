import 'package:flutter/material.dart';
import 'package:tufind_frontend/model/color.dart';

class MySearchField extends StatefulWidget {
  const MySearchField(
      {super.key, required this.controller, required this.function});

  final TextEditingController controller;
  final Function() function;

  @override
  State<MySearchField> createState() => _MySearchFieldState();
}

class _MySearchFieldState extends State<MySearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      cursorColor: lightBlue,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
              icon: const Icon(Icons.search), onPressed: widget.function),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: "Search",
        contentPadding: const EdgeInsets.only(
          left: 20,
        ),
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
