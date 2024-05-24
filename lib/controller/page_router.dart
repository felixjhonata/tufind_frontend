import 'package:flutter/material.dart';
import 'package:tufind_frontend/view/home_page.dart';
import 'package:tufind_frontend/view/login_page.dart';
import 'package:tufind_frontend/view/register_page.dart';

class PageRouter {
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

  static toHomePage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }
}
