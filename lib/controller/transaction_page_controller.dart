import 'package:flutter/material.dart';
import 'package:tufind_frontend/controller/backend_controller.dart';
import 'package:tufind_frontend/model/color.dart';
import 'package:tufind_frontend/view/ui-components/button.dart';

class TransactionPageController {
  static void getBids() {
    BackendController.get("api/protected/bid/:auction_id");
  }

  static Column _generateColumn(String tutorName, int rate, int session,
      {String? buttonText,
      Function()? buttonFunc,
      Color? buttonColor,
      bool isFill = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            SizedBox(
              width: 170,
              child: Text(tutorName),
            ),
            SizedBox(
              width: 120,
              child: Text("Rp ${rate}k/ses"),
            ),
            SizedBox(
              child: Text(session.toString()),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 100,
          height: 40,
          child: MyButton(
            onPressed: buttonFunc,
            text: buttonText!,
            color: buttonColor ??= Colors.transparent,
            isFill: isFill,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  static List<Column> getOnGoingBid() {
    List<Column> onGoingBids = [];
    onGoingBids.add(_generateColumn(
      "John Doe",
      35,
      22,
      buttonText: "Rebid",
      buttonFunc: null,
      buttonColor: lightBlue,
    ));
    return onGoingBids;
  }

  static List<Column> getOutbiddedBid() {
    List<Column> outbiddedBid = [];
    outbiddedBid.add(_generateColumn(
      "John Doe",
      35,
      22,
      buttonText: "Rebid",
      buttonFunc: null,
      buttonColor: lightBlue,
    ));
    return outbiddedBid;
  }

  static List<Column> getAcceptedBid() {
    List<Column> acceptedBid = [];
    acceptedBid.add(_generateColumn(
      "John Doe",
      35,
      22,
      buttonText: "Rebid",
      buttonFunc: null,
      buttonColor: lightBlue,
    ));

    acceptedBid.add(_generateColumn(
      "John Doe",
      40,
      30,
      buttonText: "Paid",
      buttonFunc: null,
      isFill: false,
    ));
    return acceptedBid;
  }
}
