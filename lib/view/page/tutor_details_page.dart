import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tufind_frontend/controller/tutor_details_page_controller.dart';
import 'package:tufind_frontend/model/color.dart';
import 'package:tufind_frontend/model/price.dart';
import 'package:tufind_frontend/view/ui-components/back_button.dart';
import 'package:tufind_frontend/view/ui-components/number_field.dart';

class TutorDetailsPage extends StatefulWidget {
  const TutorDetailsPage(
      {super.key, required this.tutorName, required this.tutorUniversity});

  final String tutorName;
  final String tutorUniversity;

  @override
  State<TutorDetailsPage> createState() => _TutorDetailsPageState();
}

class _TutorDetailsPageState extends State<TutorDetailsPage> {
  Price price = Price(20, 35);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              bottom: -20,
              right: -20,
              child: SvgPicture.asset("assets/logo.svg", width: 130),
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Text(
                  widget.tutorName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: darkBlue,
                  ),
                ),
                Text(
                  widget.tutorUniversity,
                  style: const TextStyle(
                    color: lightBlue,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          const Text(
                            "UTBK Score Details",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: darkBlue,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ] +
                        TutorDetailsPageController.getScores(),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Session Amount",
                            style: TextStyle(
                              color: darkBlue,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          MyNumberField(
                            setter: price.setSessionAmnt,
                            getter: price.getSessionAmnt,
                            minValue: 20,
                            parent: this,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Price Rate",
                            style: TextStyle(
                              color: darkBlue,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          MyNumberField(
                            setter: price.setPriceRate,
                            getter: price.getPriceRate,
                            minValue: 35,
                            increment: 5,
                            parent: this,
                          ),
                        ],
                      ),
                      Text(
                        "Total Price: Rp ${price.calculateTotal()}k",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: lightBlue,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const MyBackButton(),
          ],
        ),
      ),
    );
  }
}