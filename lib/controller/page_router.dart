import 'package:flutter/material.dart';
import 'package:tufind_frontend/view/page/home_page.dart';
import 'package:tufind_frontend/view/page/landing_page.dart';
import 'package:tufind_frontend/view/page/login_page.dart';
import 'package:tufind_frontend/view/page/profile_page.dart';
import 'package:tufind_frontend/view/page/register_page.dart';
import 'package:tufind_frontend/view/page/transaction_page.dart';

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

  static void toHomePage(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }

  static void toTransactionPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TransactionPage(),
        ));
  }

  static void toProfilePage(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        ));
  }

  static void toLandingPage(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LandingPage(),
        ));
  }
}
