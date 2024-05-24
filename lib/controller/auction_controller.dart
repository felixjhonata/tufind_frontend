import 'package:flutter/material.dart';
import 'package:tufind_frontend/model/color.dart';
import 'package:tufind_frontend/view/page/tutor_details_page.dart';

class AuctionController {
  static GestureDetector _generateTutorDetails(BuildContext context,
      String name, String university, double score, int rate) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TutorDetailsPage(
                      tutorName: name,
                      tutorUniversity: university,
                    )));
      },
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: darkBlue,
                  ),
                ),
                Text(
                  university,
                  style: const TextStyle(
                    fontSize: 13,
                    color: darkBlue,
                  ),
                ),
                Text(
                  "UTBK Score: ${score}",
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
                  "Rp ${rate}k",
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
    List<Widget> tutors = [];
    tutors.add(_generateTutorDetails(
        context, "John Doe", "Universitas Indonesia", 442.33, 50));

    return tutors;
  }
}
