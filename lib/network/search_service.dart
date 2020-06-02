import 'package:http/http.dart' as http;
import 'package:privateinvestorsmobile/expose/exposeObject.dart';
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
    int priceTo = 100000, int pageNumber = 1, int limit = 6, List<RealEstateObject> estateList }) async {
    final response =
    await http.get('https://pib-prod.is24-baufi.eu-west-1.infinity.s24cloud.net/pib/endpoint/search?geoCodes=$geocode&exposeType=$estateType&priceTo=$priceTo&sortBy=firstActivationDate%3Adesc&pageSize=$limit&pageNumber=$pageNumber');
    List<RealEstateObject> estates = [];

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body)['results'];

      for (var obj in jsonData) {
        estates.add(RealEstateObject.fromJson(obj));
      }
       //estateList.addAll(estates);
      return estates;
    } else {
      throw Exception('Something went wrong . . .');
    }
  } /**
     * fetchEstate()
     * This method takes an string ID as a parameter and fetches an expose by its ID
     * For that, the methods sends a HTTP-GET request to the immoscout24 API.
     * The server itself responds back a body-json with the Status Code 200, when the
     * query is succesful.
     * The responded body will then be decoded from a string into a json.
     * This json will be factored into the fields of the class ExposeObject.
     * @param id: String - ID of an estate
     * @returns: ExposeObject (look in class exposeObject.dart)
     * @Exception: On Rejected
     */
  Future <ExposeObject> fetchEstate({String id = "118344311"}) async{
    final response = await http.get('https://pib-prod.is24-baufi.eu-west-1.infinity.s24cloud.net/pib/endpoint/exposes/$id');

    if (response.statusCode == 200 ) {
      var jsonData = json.decode(response.body);
      ExposeObject exposeObject = ExposeObject.fromJson(jsonData);
      return exposeObject;
    } else {
      throw Exception('Something went not right ...');
    }
  }


  Future <RealEstateObject> fetchFavorite({String id = "118344311"}) async{
    final response = await http.get('https://pib-prod.is24-baufi.eu-west-1.infinity.s24cloud.net/pib/endpoint/exposes/$id');

    if (response.statusCode == 200 ) {
      var jsonData = json.decode(response.body);
      RealEstateObject favoriteObject = RealEstateObject.fromJson(jsonData);
      return favoriteObject;
    } else {
      throw Exception('Something went not right ...');
    }
  }



}