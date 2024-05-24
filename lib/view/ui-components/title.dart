import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tufind_frontend/model/color.dart';

class MyTitle extends StatelessWidget {
  final String firstPart, secondPart;

  const MyTitle({super.key, required this.firstPart, required this.secondPart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/logo.svg",
          width: 150,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              firstPart,
              style: const TextStyle(
                color: darkBlue,
                fontWeight: FontWeight.w800,
                fontSize: 40,
              ),
            ),
            Text(
              secondPart,
              style: const TextStyle(
                color: lightBlue,
                fontWeight: FontWeight.w800,
                fontSize: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
