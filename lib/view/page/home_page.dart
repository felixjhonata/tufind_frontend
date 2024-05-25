import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tufind_frontend/controller/page_router.dart';
import 'package:tufind_frontend/model/color.dart';
import 'package:tufind_frontend/view/module/auction.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBar(
        backgroundColor: darkBlue,
        destinations: [
          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.home,
              color: Colors.white,
              size: 40,
            ),
          ),
          IconButton(
            onPressed: () => PageRouter.toProfilePage(context),
            icon: const Icon(
              Icons.person,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.only(
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
                  onPressed: () => PageRouter.toTransactionPage(context),
                  icon: const Icon(
                    Icons.receipt_long,
                    size: 40,
                    color: darkBlue,
                  ),
                ),
              ],
            ),
          ),
          const Row(
            children: [
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
          const SizedBox(height: 20),

          // Auction ends at
          Row(
            children: [
              const Text(
                "Auction ends at ",
                style: TextStyle(color: darkBlue),
              ),
              Text(
                "${DateTime.now().day.toString().padLeft(2, "0")}/${DateTime.now().month.toString().padLeft(2, "0")}/${DateTime.now().year} ${DateTime.now().hour.toString().padLeft(2, "0")}:${DateTime.now().minute.toString().padLeft(2, "0")} WIB",
                style: const TextStyle(
                  color: lightBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          const MyAuction(),
        ],
      ),
    );
  }
}
