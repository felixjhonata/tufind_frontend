import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tufind_frontend/controller/backend_controller.dart';
import 'package:tufind_frontend/controller/page_router.dart';
import 'package:tufind_frontend/model/color.dart';
import 'package:tufind_frontend/model/user.dart';

class LoginPageController {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static void resetControllers() {
    emailController.text = "";
    passwordController.text = "";
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

  static void login(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (email.isEmpty || password.isEmpty) {
      _makeDialog(context, "Please fill all fields");
      return;
    } else if (!emailRegex.hasMatch(email)) {
      _makeDialog(context, "Invalid Email Address");
      return;
    } else if (password.length < 8) {
      _makeDialog(context, "Password must be at least 8 characters long.");
    } else if (password.length > 20) {
      _makeDialog(context, "Password must be at most 20 characters long.");
    }

    User.email = email;

    Map<String, String> body = {
      "email": email,
      "password": password,
    };
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

    BackendController.post("api/public/users/login", body: body)
        .then((response) {
      Navigator.pop(context);

      if (response.statusCode == 200) {
        User.authToken = jsonDecode(response.body)["token"];
        User.id = jsonDecode(response.body)["userid"];
        Navigator.pop(context);
        PageRouter.toHomePage(context);
      } else {
        _makeDialog(context, jsonDecode(response.body)["Error"]);
      }
    });
  }
}
