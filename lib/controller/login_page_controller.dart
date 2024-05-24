import 'package:flutter/material.dart';

class LoginPageController {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static void resetControllers() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  static void login(BuildContext context) {
    print("Email: ${emailController.text}");
  }
}
