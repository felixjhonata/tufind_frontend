import 'package:flutter/material.dart';
import 'package:tufind_frontend/controller/auction_controller.dart';
import 'package:tufind_frontend/model/color.dart';
import 'package:tufind_frontend/view/ui-components/search_field.dart';

class MyAuction extends StatefulWidget {
  const MyAuction({super.key});

  @override
  State<MyAuction> createState() => _MyAuctionState();
}

class _MyAuctionState extends State<MyAuction> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Column(
      children: <Widget>[
            MySearchField(controller: searchController, function: () {}),
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
          AuctionController.getTutors(context),
    );
  }
}
