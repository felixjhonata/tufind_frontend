import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tufind_frontend/controller/backend_controller.dart';
import 'package:tufind_frontend/controller/login_page_controller.dart';
import 'package:tufind_frontend/model/color.dart';
import 'package:tufind_frontend/model/user.dart';

class RegisterPageController {
  static bool agreeToTermsAndConditions = false;
  static TextEditingController emailController = TextEditingController();
  static TextEditingController usernameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confirmPasswordController =
      TextEditingController();

  static void resetControllers() {
    emailController.text = "";
    usernameController.text = "";
    passwordController.text = "";
    confirmPasswordController.text = "";
    agreeToTermsAndConditions = false;
  }

  static void _makeDialog(BuildContext context, String errorText) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: darkBlue,
        title: const Icon(
          Icons.warning,
          size: 100,
          color: Colors.white,
        ),
        content: Text(
          errorText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  static void register(BuildContext context) {
    String username = usernameController.text;
    String email = emailController.text;
    String confirmPassword = confirmPasswordController.text;
    String password = passwordController.text;

    String errorText = "";
    RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      errorText = "Please fill in all fields.";
    } else if (!agreeToTermsAndConditions) {
      errorText = "Please agree to the terms & condition";
    } else if (password.compareTo(confirmPassword) != 0) {
      errorText = "Passwords do not match";
    } else if (!emailRegex.hasMatch(email)) {
      errorText = "Invalid Email Address";
    } else if (password.length < 8) {
      errorText = "Password must be at least 8 characters long.";
    } else if (password.length > 20) {
      errorText = "Password must be at most 20 characters long.";
    } else if (password.contains(" ")) {
      errorText = "Password cannot contain spaces.";
    }

    if (errorText.isNotEmpty) {
      _makeDialog(context, errorText);
      return;
    }

    User.email = email;
    User user = User(username, password);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Dialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 180),
        child: SizedBox(
          height: 50,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
    BackendController.post("api/public/users/signup", body: user.toJson())
        .then((response) {
      Navigator.pop(context);
      if (response.statusCode == 200) {
        LoginPageController.emailController.text = email;
        LoginPageController.passwordController.text = password;
        LoginPageController.login(context);
      } else {
        _makeDialog(context, jsonDecode(response.body)["Error"]);
      }
    });
  }
}
