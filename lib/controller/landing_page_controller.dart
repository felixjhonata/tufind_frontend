import 'package:flutter/material.dart';
import 'package:tufind_frontend/view/login_page.dart';
import 'package:tufind_frontend/view/register_page.dart';

class LandingPageController {
  static void toLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  static void toRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      ),
    );
  }
}
