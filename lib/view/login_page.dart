import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tufind_frontend/controller/login_page_controller.dart';
import 'package:tufind_frontend/model/color.dart';
import 'package:tufind_frontend/view/ui-components/back_button.dart';
import 'package:tufind_frontend/view/ui-components/button.dart';
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
                      MyTextField(
                        hintText: "Username / Email",
                        icon: Icons.person,
                        controller: emailController,
                      ),
                      MyTextField(
                        hintText: "Password",
                        icon: Icons.password,
                        controller: passwordController,
                        obscureText: true,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 20),
                        padding: const EdgeInsets.only(right: 40),
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => print("user forgot his/her password"),
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
          const MyBackButton(onPressed: LoginPageController.resetControllers,),
        ],
      ),
    );
  }
}
