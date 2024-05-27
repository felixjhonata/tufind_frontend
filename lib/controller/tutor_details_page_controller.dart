import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tufind_frontend/controller/backend_controller.dart';
import 'package:tufind_frontend/controller/page_router.dart';
import 'package:tufind_frontend/model/color.dart';
import 'package:tufind_frontend/model/tutor.dart';
import 'package:tufind_frontend/model/user.dart';

class TutorDetailsPageController {
  static Tutor? tutor;

  static Widget _generateScoreDetail(String subject, double score) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 250,
          child: Text(
            subject,
            style: TextStyle(
              color: darkBlue,
              fontWeight: subject.compareTo("Average") == 0
                  ? FontWeight.w700
                  : FontWeight.w400,
            ),
          ),
        ),
        Text(
          score.toStringAsFixed(2),
          style: const TextStyle(
            color: lightBlue,
          ),
        ),
      ],
    );
  }

  static List<Widget> getScores() {
    List<Widget> scoreDetails = [];

    Map<String, double> scores = tutor!.score;

    scores.forEach((key, value) {
      scoreDetails.add(_generateScoreDetail(key, value));
      scoreDetails.add(const SizedBox(height: 10));
    });

    return scoreDetails;
  }

  static void _makeDialog(BuildContext context, String errorText) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: darkBlue,
        title: const Icon(
          Icons.warning,
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

  static void bid(BuildContext context, int price, int session) {
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

    BackendController.post(
      "api/protected/bid",
      body: {
        "user_id": User.id,
        "auctiontutor_id": tutor!.auctionTutorID,
        "price": price,
        "session": session,
      },
      headers: BackendController.getHeader(),
    ).then((value) {
      Navigator.pop(context);
      if (value.statusCode == 200) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            content: Text(
              "Check Transaction Page for details",
            ),
            title: Text(
              "Bid Placed",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ).then((value) {
          Navigator.pop(context);
          PageRouter.toHomePage(context);
        });
      } else {
        _makeDialog(context, jsonDecode(value.body)["error"]);
      }
    });
  }
}
