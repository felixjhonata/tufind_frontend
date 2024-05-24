import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tufind_frontend/model/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: darkBlue,
        destinations: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.home,
              color: Colors.white,
              size: 40,
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.person,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 80,
              bottom: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/logo.svg",
                  width: 80,
                ),
                IconButton(
                  onPressed: () => print("to transaction"),
                  icon: const Icon(
                    Icons.receipt_long,
                    size: 40,
                    color: darkBlue,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 40,
            ),
            child: Row(
              children: const [
                Text(
                  "Let's ",
                  style: TextStyle(
                    fontSize: 30,
                    color: darkBlue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "Learn!",
                  style: TextStyle(
                    fontSize: 30,
                    color: lightBlue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
