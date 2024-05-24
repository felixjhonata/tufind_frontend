class Price {
  int _sessionAmnt = 0;
  int _priceRate = 0;

  int getPriceRate() {
    return _priceRate;
  }

  void setPriceRate(int priceRate) {
    _priceRate = priceRate;
  }

  int getSessionAmnt() {
    return _sessionAmnt;
  }

  void setSessionAmnt(int sessionAmnt) {
    _sessionAmnt = sessionAmnt;
  }

  int calculateTotal() {
    return _sessionAmnt * _priceRate;
  }

  Price(this._sessionAmnt, this._priceRate);
}
