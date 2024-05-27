import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tufind_frontend/controller/backend_controller.dart';
import 'package:tufind_frontend/controller/page_router.dart';
import 'package:tufind_frontend/model/color.dart';
import 'package:tufind_frontend/model/tutor.dart';

class HomePageController {
  static DateTime auctionEnd = DateTime.now();
  static int auctionID = 0;
  static List<Tutor> tutors = [];

  static Future<void> refreshAuction(BuildContext context) async {
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

    Response response = await BackendController.get(
      "api/protected/auction",
      headers: BackendController.getHeader(),
    );

    if (response.statusCode == 200) {
      onRefresh(response).then((value) => Navigator.pop(context));
    }
  }

  static Future<void> getAuctionEnd() async {
    Response response = await BackendController.get(
      "api/protected/auction",
      headers: BackendController.getHeader(),
    );

    if (response.statusCode == 200) {
      await onRefresh(response);
    }
  }

  static Future<void> onRefresh(Response response) async {
    var body = jsonDecode(response.body);
    auctionEnd = DateTime.parse(body["expected_end_time"]);
    auctionID = body["ID"];

    var value = await BackendController.get(
        "api/protected/auctiontutors/$auctionID",
        headers: BackendController.getHeader());

    if (value.statusCode == 200) {
      var body = jsonDecode(value.body);
      tutors.clear();
      for (var x in body) {
        Map<String, int> score = {};

        var tutor = x["tutor"];

        double totalScore = 0;
        double totalAmnt = 0;
        if (tutor["kemampuan_penalaran_umum"] != null) {
          score.addAll(
              {"Kemampuan Penalaran Umum": tutor["kemampuan_penalaran_umum"]});
          totalAmnt++;
          totalScore = tutor["kemampuan_penalaran_umum"] + totalScore;
        }
        if (tutor["pengetahuan_dan_pemahaman_umum"] != null) {
          score.addAll(
              {"Pengetahuan Umum": tutor["pengetahuan_dan_pemahaman_umum"]});
          totalAmnt++;
          totalScore = tutor["pengetahuan_dan_pemahaman_umum"] + totalScore;
        }
        if (tutor["pengetahuan_kuantitatif"] != null) {
          score.addAll(
              {"Pengetahuan Kuantitatif": tutor["pengetahuan_kuantitatif"]});
          totalAmnt++;
          totalScore = tutor["pengetahuan_kuantitatif"] + totalScore;
        }
        if (tutor["math"] != null) {
          score.addAll({"Matematika": tutor["math"]});
          totalAmnt++;
          totalScore = tutor["math"] + totalScore;
        }
        if (tutor["physics"] != null) {
          score.addAll({"Fisika": tutor["physics"]});
          totalAmnt++;
          totalScore = tutor["physics"] + totalScore;
        }
        if (tutor["biology"] != null) {
          score.addAll({"Biologi": tutor["biology"]});
          totalAmnt++;
          totalScore = tutor["biology"] + totalScore;
        }
        if (tutor["chemistry"] != null) {
          score.addAll({"Kimia": tutor["chemistry"]});
          totalAmnt++;
          totalScore = tutor["chemistry"] + totalScore;
        }
        if (tutor["history"] != null) {
          score.addAll({"Sejarah": tutor["history"]});
          totalAmnt++;
          totalScore = tutor["history"] + totalScore;
        }
        if (tutor["geography"] != null) {
          score.addAll({"Geografi": tutor["geography"]});
          totalAmnt++;
          totalScore = tutor["geography"] + totalScore;
        }
        if (tutor["sosiology"] != null) {
          score.addAll({"Sosiologi": tutor["sosiology"]});
          totalAmnt++;
          totalScore = tutor["sosiology"] + totalScore;
        }
        if (tutor["economy"] != null) {
          score.addAll({"Ekonomi": tutor["economy"]});
          totalAmnt++;
          totalScore = tutor["economy"] + totalScore;
        }
        score.addAll({"Average": (totalScore / totalAmnt).round()});
        tutors.add(Tutor(
            x["ID"],
            "${tutor["first_name"]} ${tutor["last_name"]}",
            tutor["university"],
            tutor["price"],
            score));
      }
    }
  }

  static GestureDetector _generateTutorDetails(
      BuildContext context, Tutor tutor) {
    return GestureDetector(
      onTap: () => PageRouter.toTutorDetails(context, tutor),
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tutor.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: darkBlue,
                  ),
                ),
                Text(
                  tutor.university,
                  style: const TextStyle(
                    fontSize: 13,
                    color: darkBlue,
                  ),
                ),
                Text(
                  "UTBK Score: ${tutor.score["Average"]}",
                  style: const TextStyle(
                    fontSize: 11,
                    color: lightBlue,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Rp ${tutor.price}k",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: darkBlue,
                  ),
                ),
                const Text(
                  "per session",
                  style: TextStyle(
                    fontSize: 12,
                    color: lightBlue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static List<Widget> getTutors(BuildContext context) {
    List<Widget> tutorRow = [];
    tutors.forEach((element) {
      tutorRow.add(_generateTutorDetails(context, element));
      tutorRow.add(SizedBox(height: 10));
    });

    return tutorRow;
  }
}
