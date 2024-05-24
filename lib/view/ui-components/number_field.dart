import 'package:flutter/material.dart';
import 'package:tufind_frontend/model/color.dart';

class MyNumberField extends StatefulWidget {
  const MyNumberField(
      {super.key,
      this.minValue = 0,
      this.increment = 1,
      required this.setter,
      required this.getter,
      required this.parent});

  final int minValue;
  final int increment;
  final Function(int) setter;
  final Function() getter;
  final State parent;

  @override
  State<MyNumberField> createState() => _MyNumberFieldState();
}

class _MyNumberFieldState extends State<MyNumberField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => setState(() {
            if (widget.getter() == widget.minValue) {
              return;
            }
            widget.setter(widget.getter() - widget.increment);
            widget.parent.setState(() {});
          }),
          color: darkBlue,
          icon: const Icon(Icons.remove),
        ),
        Text(
          widget.getter().toString(),
          style: const TextStyle(
            color: darkBlue,
          ),
        ),
        IconButton(
          onPressed: () => setState(() {
            widget.setter(widget.getter() + widget.increment);
            widget.parent.setState(() {});
          }),
          color: darkBlue,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
