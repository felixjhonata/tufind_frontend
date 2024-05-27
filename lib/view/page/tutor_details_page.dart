import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tufind_frontend/controller/tutor_details_page_controller.dart';
import 'package:tufind_frontend/model/color.dart';
import 'package:tufind_frontend/model/price.dart';
import 'package:tufind_frontend/model/tutor.dart';
import 'package:tufind_frontend/view/ui-components/back_button.dart';
import 'package:tufind_frontend/view/ui-components/button.dart';
import 'package:tufind_frontend/view/ui-components/number_field.dart';

class TutorDetailsPage extends StatefulWidget {
  const TutorDetailsPage({super.key, required this.tutor});

  final Tutor tutor;

  @override
  State<TutorDetailsPage> createState() => _TutorDetailsPageState();
}

class _TutorDetailsPageState extends State<TutorDetailsPage> {
  int minSession = 2;
  late int minPrice;
  late Price price;

  @override
  void initState() {
    super.initState();
    minPrice = widget.tutor.price + 5;
    TutorDetailsPageController.tutor = widget.tutor;

    price = Price(minSession, minPrice);
  }

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
                  widget.tutor.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: darkBlue,
                  ),
                ),
                Text(
                  widget.tutor.university,
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
                            minValue: minSession,
                            parent: this,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Price Rate (per session)",
                            style: TextStyle(
                              color: darkBlue,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          MyNumberField(
                            setter: price.setPriceRate,
                            getter: price.getPriceRate,
                            minValue: minPrice,
                            increment: 5,
                            parent: this,
                            isPrice: true,
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
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 250,
                        child: MyButton(
                          onPressed: () => TutorDetailsPageController.bid(
                            context,
                            price.getPriceRate(),
                            price.getSessionAmnt(),
                          ),
                          text: "Bid",
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
