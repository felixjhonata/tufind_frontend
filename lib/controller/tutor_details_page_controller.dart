import 'package:flutter/material.dart';
import 'package:tufind_frontend/model/color.dart';

class TutorDetailsPageController {
  static int? sessionAmnt;
  static int? priceRate;

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
          "$score",
          style: const TextStyle(
            color: lightBlue,
          ),
        ),
      ],
    );
  }

  static List<Widget> getScores() {
    List<Widget> scoreDetails = [];

    Map<String, double> scores = {
      "Kemampuan Penalaran Umum": 381.67,
      "Kemampuan Memahami Bacaan dan Menulis": 528.32,
      "Pengetahuan dan Pemahaman Umum": 571.08,
      "Pengetahuan Kuantitatif": 368.19,
      "Matematika": 457.84,
      "Fisika": 418.64,
      "Kimia": 415.38,
      "Biologi": 397.50,
      "Average": 442.3275,
    };

    scores.forEach((key, value) {
      scoreDetails.add(_generateScoreDetail(key, value));
      scoreDetails.add(const SizedBox(height: 10));
    });

    return scoreDetails;
  }

  static void bid(BuildContext context, int rate, int session) {
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
    ).then((value) => Navigator.pop(context));
  }
}
