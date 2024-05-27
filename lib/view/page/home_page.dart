import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tufind_frontend/controller/home_page_controller.dart';
import 'package:tufind_frontend/controller/page_router.dart';
import 'package:tufind_frontend/model/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    DateTime endTime = HomePageController.auctionEnd;

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
            onPressed: () => PageRouter.toTransactionPage(context),
            icon: const Icon(
              Icons.receipt_long,
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
                      onPressed: () =>
                        HomePageController.showProfile(context),
                      icon: const Icon(
                        Icons.person,
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
                  SizedBox(
                    width: 280,
                    child: Row(
                      children: [
                        const Text(
                          "Auction ends at ",
                          style: TextStyle(color: darkBlue),
                        ),
                        Text(
                          "${endTime.day.toString().padLeft(2, "0")}/${endTime.month.toString().padLeft(2, "0")}/${endTime.year} ${((endTime.hour + 7) % 24).toString().padLeft(2, "0")}:${endTime.minute.toString().padLeft(2, "0")} WIB",
                          style: const TextStyle(
                            color: lightBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() {
                      HomePageController.refreshAuction(context);
                    }),
                    icon: const Icon(
                      Icons.refresh,
                      color: darkBlue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tutor Details",
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Price Rate",
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Divider(),
            ] +
            HomePageController.getTutors(context),
      ),
    );
  }
}
