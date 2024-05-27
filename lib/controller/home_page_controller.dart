import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tufind_frontend/controller/backend_controller.dart';
import 'package:tufind_frontend/controller/page_router.dart';
import 'package:tufind_frontend/model/color.dart';
import 'package:tufind_frontend/model/tutor.dart';
import 'package:tufind_frontend/model/user.dart';
import 'package:tufind_frontend/view/ui-components/button.dart';

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
        Map<String, double> score = {};

        var tutor = x["tutor"];

        double totalScore = 0;
        double totalAmnt = 0;
        if (tutor["kemampuan_penalaran_umum"] != null) {
          score.addAll({
            "Kemampuan Penalaran Umum":
                tutor["kemampuan_penalaran_umum"].toDouble()
          });
          totalAmnt++;
          totalScore = tutor["kemampuan_penalaran_umum"] + totalScore;
        }
        if (tutor["pengetahuan_dan_pemahaman_umum"] != null) {
          score.addAll({
            "Pengetahuan Umum":
                tutor["pengetahuan_dan_pemahaman_umum"].toDouble()
          });
          totalAmnt++;
          totalScore = tutor["pengetahuan_dan_pemahaman_umum"] + totalScore;
        }
        if (tutor["pengetahuan_kuantitatif"] != null) {
          score.addAll({
            "Pengetahuan Kuantitatif":
                tutor["pengetahuan_kuantitatif"].toDouble()
          });
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
        tutors.add(Tutor(
            x["ID"],
            "${tutor["first_name"]} ${tutor["last_name"]}",
            tutor["university"],
            tutor["price"],
            score));
      }
    }
  }

  static void showProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 100,
            child: Column(
              children: [
                Text(
                  User.email.toLowerCase(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                MyButton(
                  onPressed: () {
                    Navigator.pop(context);
                    PageRouter.toLandingPage(context);
                  },
                  text: "LOGOUT",
                  color: Colors.red[900]!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
                  "UTBK Score: ${tutor.score["Average"]!.toStringAsFixed(1)}",
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
                  "Rp ${tutor.price + 5}k",
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
    for (var element in tutors) {
      tutorRow.add(_generateTutorDetails(context, element));
      tutorRow.add(const SizedBox(height: 10));
    }

    return tutorRow;
  }
}
