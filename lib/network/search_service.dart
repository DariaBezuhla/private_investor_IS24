import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:privateinvestorsmobile/results/card/real_estate_object.dart';

/* Search Service Class , fecth data from API */
class SearchService {
  SearchService(){}

  /**
   * Method name : fetchList
   * @params: get geocode: Integer, estateType:String priceTo: Integer, pageNumber: Integer
   * @return:Arraylist from EstateCard
   */
  Future<List<RealEstateObject>> fetchList({int geocode = 1276003001, String estateType = 'BOTH',
    int priceTo = 100000, int pageNumber = 1, int limit = 3, List<RealEstateObject> estateList }) async {
    final response =
    await http.get('https://pib-prod.is24-baufi.eu-west-1.infinity.s24cloud.net/pib/endpoint/search?geoCodes=$geocode&exposeType=$estateType&priceTo=$priceTo&sortBy=firstActivationDate%3Adesc&pageSize=$limit&pageNumber=$pageNumber');

    List<RealEstateObject> estates = [];

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body)['results'];

      for (var obj in jsonData) {
        estates.add(RealEstateObject.fromJson(obj));
      }
      // estateList.addAll(estates);
      return estates;
    } else {
      throw Exception('Something went wrong . . .');
    }
  }
}