import 'package:tufind_frontend/model/tutor.dart';

class Bid {
  int id;
  Tutor tutor;
  String tutorName;
  int session;
  int price;
  String status;
  bool paid;
  int auctionID;

  Bid(this.id, this.tutorName, this.session, this.price, this.status, this.paid,
      this.auctionID, this.tutor);
}
