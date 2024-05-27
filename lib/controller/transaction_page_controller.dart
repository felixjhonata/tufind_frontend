import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tufind_frontend/controller/backend_controller.dart';
import 'package:tufind_frontend/controller/home_page_controller.dart';
import 'package:tufind_frontend/controller/page_router.dart';
import 'package:tufind_frontend/model/bid.dart';
import 'package:tufind_frontend/model/color.dart';
import 'package:tufind_frontend/model/tutor.dart';
import 'package:tufind_frontend/model/user.dart';
import 'package:tufind_frontend/view/ui-components/button.dart';

class TransactionPageController {
  static List<Bid> bids = [];

  static Future<void> getBids() async {
    bids.clear();
    var value = await BackendController.get("api/protected/bid/${User.id}",
        headers: BackendController.getHeader());
    var json = jsonDecode(value.body);
    if (value.statusCode == 200) {
      for (var bid in json) {
        var tutor = bid["auctiontutor"]["tutor"];
        String tutorName = "${tutor["first_name"]} ${tutor["last_name"]}";

        Map<String, double> score = {};
        double totalScore = 0;
        double totalAmnt = 0;
        if (tutor["kemampuan_penalaran_umum"] != null) {
          score.addAll(
              {"Kemampuan Penalaran Umum": tutor["kemampuan_penalaran_umum"].toDouble()});
          totalAmnt++;
          totalScore = tutor["kemampuan_penalaran_umum"] + totalScore;
        }
        if (tutor["pengetahuan_dan_pemahaman_umum"] != null) {
          score.addAll(
              {"Pengetahuan Umum": tutor["pengetahuan_dan_pemahaman_umum"].toDouble()});
          totalAmnt++;
          totalScore = tutor["pengetahuan_dan_pemahaman_umum"] + totalScore;
        }
        if (tutor["pengetahuan_kuantitatif"] != null) {
          score.addAll(
              {"Pengetahuan Kuantitatif": tutor["pengetahuan_kuantitatif"].toDouble()});
          totalAmnt++;
          totalScore = tutor["pengetahuan_kuantitatif"] + totalScore;
        }
        if (tutor["math"] != null) {
          score.addAll({"Matematika": tutor["math"].toDouble()});
          totalAmnt++;
          totalScore = tutor["math"] + totalScore;
        }
        if (tutor["physics"] != null) {
          score.addAll({"Fisika": tutor["physics"].toDouble()});
          totalAmnt++;
          totalScore = tutor["physics"] + totalScore;
        }
        if (tutor["biology"] != null) {
          score.addAll({"Biologi": tutor["biology"].toDouble()});
          totalAmnt++;
          totalScore = tutor["biology"] + totalScore;
        }
        if (tutor["chemistry"] != null) {
          score.addAll({"Kimia": tutor["chemistry"].toDouble()});
          totalAmnt++;
          totalScore = tutor["chemistry"] + totalScore;
        }
        if (tutor["history"] != null) {
          score.addAll({"Sejarah": tutor["history"].toDouble()});
          totalAmnt++;
          totalScore = tutor["history"] + totalScore;
        }
        if (tutor["geography"] != null) {
          score.addAll({"Geografi": tutor["geography"].toDouble()});
          totalAmnt++;
          totalScore = tutor["geography"] + totalScore;
        }
        if (tutor["sosiology"] != null) {
          score.addAll({"Sosiologi": tutor["sosiology"].toDouble()});
          totalAmnt++;
          totalScore = tutor["sosiology"] + totalScore;
        }
        if (tutor["economy"] != null) {
          score.addAll({"Ekonomi": tutor["economy"].toDouble()});
          totalAmnt++;
          totalScore = tutor["economy"] + totalScore;
        }
        score.addAll({"Average": (totalScore / totalAmnt)});

        bids.add(Bid(
            bid["ID"],
            tutorName,
            bid["session"],
            bid["price"],
            bid["status"],
            bid["paid"],
            bid["auctiontutor"]["auction_id"],
            Tutor(bid["auctiontutor_id"], tutorName, tutor["university"],
                tutor["price"], score)));
      }
    } else {
      print("error: ${value.statusCode}");
    }
  }

  static void _makeDialog(BuildContext context, String errorText,
      {IconData icon = Icons.warning, Color color = darkBlue}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: color,
        title: Icon(
          icon,
          size: 100,
          color: Colors.white,
        ),
        content: Text(
          errorText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  static void pay(BuildContext context, String proof, int id) {
    if (proof.isEmpty) {
      _makeDialog(context, "Please fill in proof", color: Colors.red[900]!);
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Dialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 180),
        child: SizedBox(
          height: 50,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );

    Map<String, String> body = {
      "proof": proof.toString(),
    };
    BackendController.put("api/protected/bid/pay/$id",
            body: body, headers: BackendController.getHeader())
        .then((value) {
      Navigator.pop(context);
      if (value.statusCode == 200) {
        _makeDialog(context, "Pay Successful", icon: Icons.thumb_up);
      } else {
        print("error: ${value.statusCode}");
      }
    });
  }

  static void showDialogPay(BuildContext context, int id) {
    TextEditingController proofTF = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Pay",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          content: TextField(
            controller: proofTF,
            decoration: const InputDecoration(hintText: "No. ref"),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                pay(context, proofTF.text, id);
              },
              child: const Text("Pay"),
            )
          ],
        );
      },
    );
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

  static List<Column> getOnGoingBid(BuildContext context) {
    List<Column> onGoingBids = [];
    for (var bid in bids) {
      if (bid.status.compareTo("valid") == 0 &&
          !bid.paid &&
          bid.auctionID == HomePageController.auctionID) {
        onGoingBids.add(_generateColumn(
          bid.tutorName,
          bid.price,
          bid.session,
          buttonText: "Rebid",
          buttonFunc: () =>
              PageRouter.toTutorDetails(context, bid.tutor, replace: true),
          buttonColor: darkBlue,
        ));
      }
    }

    return onGoingBids;
  }

  static List<Column> getOutbiddedBid(BuildContext context) {
    List<Column> outbiddedBid = [];
    for (var bid in bids) {
      if (bid.status.compareTo("invalid") == 0 &&
          bid.auctionID == HomePageController.auctionID) {
        outbiddedBid.add(_generateColumn(
          bid.tutorName,
          bid.price,
          bid.session,
          buttonText: "Rebid",
          buttonFunc: () =>
              PageRouter.toTutorDetails(context, bid.tutor, replace: true),
          buttonColor: darkBlue,
        ));
      }
    }
    return outbiddedBid;
  }

  static List<Column> getAcceptedBid(BuildContext context) {
    List<Column> acceptedBid = [];

    for (var bid in bids) {
      if (bid.status.compareTo("valid") == 0 &&
          !bid.paid &&
          bid.auctionID != HomePageController.auctionID) {
        acceptedBid.add(_generateColumn(
          bid.tutorName,
          bid.price,
          bid.session,
          buttonText: "Pay",
          buttonFunc: () => showDialogPay(context, bid.id),
          buttonColor: lightBlue,
        ));
      }
    }

    for (var bid in bids) {
      if (bid.status.compareTo("valid") == 0 && bid.paid) {
        acceptedBid.add(_generateColumn(bid.tutorName, bid.price, bid.session,
            buttonText: "Paid",
            buttonFunc: null,
            buttonColor: lightBlue,
            isFill: false));
      }
    }
    return acceptedBid;
  }
}
