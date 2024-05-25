import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tufind_frontend/controller/register_page_controller.dart';
import 'package:tufind_frontend/view/ui-components/back_button.dart';
import 'package:tufind_frontend/view/ui-components/button.dart';
import 'package:tufind_frontend/view/ui-components/check_box.dart';
import 'package:tufind_frontend/view/ui-components/password_field.dart';
import 'package:tufind_frontend/view/ui-components/text_field.dart';
import 'package:tufind_frontend/view/ui-components/title.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController =
        RegisterPageController.emailController;
    TextEditingController usernameController =
        RegisterPageController.usernameController;
    TextEditingController passwordController =
        RegisterPageController.passwordController;
    TextEditingController confirmPasswordController =
        RegisterPageController.confirmPasswordController;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  right: -100,
                  top: -150,
                  child: SvgPicture.asset("assets/background-asset-1.svg"),
                ),
                Positioned(
                  left: -50,
                  bottom: -80,
                  child: SvgPicture.asset("assets/background-asset-2.svg"),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    const MyTitle(
                      firstPart: "REGI",
                      secondPart: "STER",
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: MyTextField(
                        hintText: "Username",
                        icon: Icons.person,
                        controller: usernameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: MyTextField(
                        hintText: "Email",
                        icon: Icons.email,
                        controller: emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: MyPasswordField(
                        hintText: "Password (must consists of 8-20 characters)",
                        icon: Icons.password,
                        controller: passwordController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: MyPasswordField(
                        hintText: "Confirm Password",
                        icon: Icons.password,
                        controller: confirmPasswordController,
                      ),
                    ),
                    const MyCheckBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    MyButton(
                      onPressed: () => RegisterPageController.register(context),
                      text: "REGISTER",
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                  ],
                )
              ],
            ),
          ),
          const MyBackButton(),
        ],
      ),
    );
  }
}
