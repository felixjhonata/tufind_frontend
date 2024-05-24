class Tutor {
  String name;
  String university;
  late int priceRate;
  int score;

  Tutor(this.name, this.university, this.score) {
    refreshPrice();
  }

  void refreshPrice() {
    // TODO: Fetch Price Rate from Server
    priceRate = 0;
  }
}
