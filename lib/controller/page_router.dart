import 'package:flutter/material.dart';
import 'package:tufind_frontend/controller/home_page_controller.dart';
import 'package:tufind_frontend/controller/login_page_controller.dart';
import 'package:tufind_frontend/controller/register_page_controller.dart';
import 'package:tufind_frontend/model/tutor.dart';
import 'package:tufind_frontend/view/page/home_page.dart';
import 'package:tufind_frontend/view/page/landing_page.dart';
import 'package:tufind_frontend/view/page/login_page.dart';
import 'package:tufind_frontend/view/page/profile_page.dart';
import 'package:tufind_frontend/view/page/register_page.dart';
import 'package:tufind_frontend/view/page/transaction_page.dart';
import 'package:tufind_frontend/view/page/tutor_details_page.dart';

class PageRouter {
  static void toLogin(BuildContext context) {
    LoginPageController.resetControllers();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  static void toRegister(BuildContext context) {
    RegisterPageController.resetControllers();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      ),
    );
  }

  static void toHomePage(BuildContext context) {
    HomePageController.getAuctionEnd()
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            )));
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

  static void toTutorDetails(BuildContext context, Tutor tutor) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TutorDetailsPage(
                  tutor: tutor,
                )));
  }
}
