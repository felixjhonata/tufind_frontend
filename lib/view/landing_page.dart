import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tufind_frontend/controller/landing_page_controller.dart';
import 'package:tufind_frontend/model/color.dart';
import 'package:tufind_frontend/view/ui-components/button.dart';
import 'package:tufind_frontend/view/ui-components/title.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -150,
            left: 50,
            child: SvgPicture.asset("assets/background-asset-1.svg"),
          ),
          Positioned(
            bottom: -80,
            left: 120,
            child: SvgPicture.asset("assets/background-asset-2.svg"),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              const MyTitle(
                firstPart: "TU",
                secondPart: "FIND",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "a way to ",
                    style: TextStyle(color: darkBlue),
                  ),
                  Text(
                    "escalate",
                    style: TextStyle(color: lightBlue),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              MyButton(
                onPressed: () => LandingPageController.toLogin(context),
                text: "LOGIN",
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                isFill: false,
                onPressed: () => LandingPageController.toRegister(context),
                text: "REGISTER",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
