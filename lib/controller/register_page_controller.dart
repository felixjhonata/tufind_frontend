import 'package:flutter/material.dart';
import 'package:tufind_frontend/model/color.dart';

class RegisterPageController {
  static bool agreeToTermsAndConditions = false;
  static TextEditingController emailController = TextEditingController();
  static TextEditingController usernameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confirmPasswordController =
      TextEditingController();

  static void resetControllers() {
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    agreeToTermsAndConditions = false;
  }

  static void register(BuildContext context) {
    String username = usernameController.text;
    String email = emailController.text;
    String confirmPassword = confirmPasswordController.text;
    String password = passwordController.text;

    String errorText = "";

    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      errorText = "Please fill in all fields.";
    } else if (!agreeToTermsAndConditions) {
      errorText = "Please check the agree to the terms & condition";
    } else if (password.compareTo(confirmPassword) == 0) {
      errorText = "Passwords do not match";
    }

    if (!errorText.isEmpty) {
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
      return;
    }
  }
}
