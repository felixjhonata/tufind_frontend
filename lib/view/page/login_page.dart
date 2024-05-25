import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tufind_frontend/controller/login_page_controller.dart';
import 'package:tufind_frontend/model/color.dart';
import 'package:tufind_frontend/view/ui-components/back_button.dart';
import 'package:tufind_frontend/view/ui-components/button.dart';
import 'package:tufind_frontend/view/ui-components/password_field.dart';
import 'package:tufind_frontend/view/ui-components/text_field.dart';
import 'package:tufind_frontend/view/ui-components/title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = LoginPageController.emailController;
    TextEditingController passwordController =
        LoginPageController.passwordController;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Positioned(
                    left: -100,
                    top: -150,
                    child: SvgPicture.asset("assets/background-asset-1.svg"),
                  ),
                  Positioned(
                    right: -50,
                    bottom: -80,
                    child: SvgPicture.asset("assets/background-asset-2.svg"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MyTitle(
                        firstPart: "LOG",
                        secondPart: "IN",
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
                          hintText: "Password",
                          icon: Icons.password,
                          controller: passwordController,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 20),
                        padding: const EdgeInsets.only(right: 40),
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: null,
                          child: const Text(
                            "Forgot Password?",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: lightBlue,
                              decorationColor: lightBlue,
                            ),
                          ),
                        ),
                      ),
                      MyButton(
                        text: "LOGIN",
                        onPressed: () => LoginPageController.login(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const MyBackButton(),
        ],
      ),
    );
  }
}
