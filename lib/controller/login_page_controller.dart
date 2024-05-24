import 'package:flutter/material.dart';
import 'package:tufind_frontend/controller/page_router.dart';

class LoginPageController {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static void resetControllers() {
    emailController.text = "";
    passwordController.text = "";
  }

  static void login(BuildContext context) {
    // TODO: Validate Login
    PageRouter.toHomePage(context);
  }
}
