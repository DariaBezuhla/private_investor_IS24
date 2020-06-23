class SearchData {
  //main filters
  static int budgetTo = 100000;
  static int geocode = 1276003001;
  static String exposeType = "BOTH";

  //additional filters investments
  static int netYieldFrom = 0;
  static int priceTrendFrom = 0;
  static int rentTrendFrom = 0;
  static int factorTo = 100;
  static int pricePerSqmTo = 1000000;

  //additional filters Real Estate
  static int roomsFrom = 0;
  static int livingSpaceFrom = 0;
  static bool refurbished = false;//condition->RealEstateCondition[].contains('REFURBISHED')
  static bool isRented = false;
  static bool plausible = false;

/*
  static int get budgetTo => _budgetTo;

  static set budgetTo(int value) {
    if (value > 100000000)  _budgetTo = 100000000;
    else  _budgetTo = value;
  }

  static bool get plausible => _plausible; //???

  static set plausible(bool value) {
    _plausible = value;
  }

  static bool get isRented => _isRented;

  static set isRented(bool value) {
    _isRented = value;
  }

  static int get livingSpaceFrom => _livingSpaceFrom;

  static set livingSpaceFrom(int value) {
    _livingSpaceFrom = value;
  }

  static int get roomsFrom => _roomsFrom;

  static set roomsFrom(int value) {
    _roomsFrom = value;
  }

  static int get pricePerSqmTo => _pricePerSqmTo;

  static set pricePerSqmTo(int value) {
    _pricePerSqmTo = value;
  }

  static int get geocode => _geocode;

  static set geocode(int value) {
    _geocode = value;
  }

  static String get exposeType => _exposeType;

  static set exposeType(String value) {
    _exposeType = value;
  }

  static int get netYieldFrom => _netYieldFrom;

  static set netYieldFrom(int value) {
    _netYieldFrom = value;
  }

  static int get priceTrendFrom => _priceTrendFrom;

  static set priceTrendFrom(int value) {
    _priceTrendFrom = value;
  }

  static int get rentTrendFrom => _rentTrendFrom;

  static set rentTrendFrom(int value) {
    _rentTrendFrom = value;
  }

  static int get factorTo => _factorTo;

  static set factorTo(int value) {
    _factorTo = value;
  }

  static bool get refurbished => _refurbished;

  static set refurbished(bool value) {
    _refurbished = value;
  }

 */
}

//https://pib-prod.is24-baufi.eu-west-1.infinity.s24cloud.net/pib/endpoint/search?geoCodes=1276003001&exposeType=BOTH&priceTo=100000&sortBy=firstActivationDate%3Adesc&pageSize=2&pageNumber=1
//geoCodes
//exposeType
//priceTo
//


int budget = 100000;