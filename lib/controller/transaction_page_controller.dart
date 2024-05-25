import 'package:flutter/material.dart';
import 'package:tufind_frontend/view/ui-components/button.dart';

class TransactionPageController {
  static Column _generateColumn(String tutorName, int rate, int session) {
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
            onPressed: () {},
            text: "Rebid",
          ),
        ),
      ],
    );
  }

  static List<Column> getOnGoingBid() {
    List<Column> onGoingBids = [];
    onGoingBids.add(_generateColumn(
      "John Doe",
      35,
      22,
    ));
    return onGoingBids;
  }

  static List<Column> getOutbiddedBid() {
    List<Column> outbiddedBid = [];
    outbiddedBid.add(_generateColumn(
      "John Doe",
      35,
      22,
    ));
    return outbiddedBid;
  }
}
