import 'package:flutter/material.dart';
import 'package:tufind_frontend/controller/register_page_controller.dart';
import 'package:tufind_frontend/model/color.dart';

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({super.key});

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
              value: RegisterPageController.agreeToTermsAndConditions,
              onChanged: (value) {
                setState(() {
                  RegisterPageController.agreeToTermsAndConditions = value!;
                });
              }),
          const Text(
            "I agree to the ",
          ),
          const Text(
            "terms & conditions.",
            style: const TextStyle(
              decoration: TextDecoration.underline,
              color: lightBlue,
              decorationColor: lightBlue,
            ),
          )
        ],
      ),
    );
  }
}
