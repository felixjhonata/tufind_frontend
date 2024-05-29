import 'package:flutter/material.dart';
import 'package:tufind_frontend/controller/page_router.dart';
import 'package:tufind_frontend/controller/transaction_page_controller.dart';
import 'package:tufind_frontend/model/color.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: darkBlue,
        destinations: [
          IconButton(
            onPressed: () => PageRouter.toHomePage(context),
            icon: const Icon(
              Icons.home,
              color: Colors.white,
              size: 40,
            ),
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.receipt_long,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        children: [
          const SizedBox(height: 100),
          const Text(
            "Transaction",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: darkBlue,
              fontWeight: FontWeight.w800,
              fontSize: 40,
            ),
          ),
          const Text(
            "History",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: lightBlue,
              fontWeight: FontWeight.w800,
              fontSize: 40,
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          // On Going Bid
          const Text(
            "On Going Bid",
            style: TextStyle(
              color: darkBlue,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 170,
                        child: Text(
                          "Name",
                          style: TextStyle(color: darkBlue),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          "Rate",
                          style: TextStyle(color: darkBlue),
                        ),
                      ),
                      Text(
                        "Session",
                        style: TextStyle(color: darkBlue),
                      ),
                    ],
                  ),
                  const Divider(),
                ] +
                TransactionPageController.getOnGoingBid(context),
          ),

          // Outbidded Bid
          const Text(
            "Outbidded Bid",
            style: TextStyle(
              color: darkBlue,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 170,
                        child: Text(
                          "Name",
                          style: TextStyle(color: darkBlue),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          "Rate",
                          style: TextStyle(color: darkBlue),
                        ),
                      ),
                      Text(
                        "Session",
                        style: TextStyle(color: darkBlue),
                      ),
                    ],
                  ),
                  const Divider(),
                ] +
                TransactionPageController.getOutbiddedBid(context),
          ),

          // Accepted Bid
          const Text(
            "Accepted Bid",
            style: TextStyle(
              color: darkBlue,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 170,
                        child: Text(
                          "Name",
                          style: TextStyle(color: darkBlue),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          "Rate",
                          style: TextStyle(color: darkBlue),
                        ),
                      ),
                      Text(
                        "Session",
                        style: TextStyle(color: darkBlue),
                      ),
                    ],
                  ),
                  const Divider(),
                ] +
                TransactionPageController.getAcceptedBid(context),
          ),
        ],
      ),
    );
  }
}
