import 'package:http/http.dart' as http;
import 'package:privateinvestorsmobile/expose/exposeObject.dart';
import 'dart:async';
import 'dart:convert';
import 'package:privateinvestorsmobile/results/card/real_estate_object.dart';
import 'package:privateinvestorsmobile/results/list/lengthOfResult.dart';
import 'package:privateinvestorsmobile/wishlist/favorites.dart';

/* Search Service Class , fecth data from API */
class SearchService {
  SearchService() {}

  /**
   * Method name : fetchList
   * @params: get geocode: Integer, estateType:String, priceTo: Integer, sortBy: String, pageNumber: Integer
   * @return:Arraylist from EstateCard
   */
  Future<List<RealEstateObject>> fetchList(
      {int geocode = 1276003001,
        String estateType = 'BOTH',
        int priceTo = 100000,
        String sortBy,
        String sort,
        int pageNumber = 0,
        int limit = 3,
        List<RealEstateObject> estateList}) async {
    final response = await http.get(
        'https://pib-prod.is24-baufi.eu-west-1.infinity.s24cloud.net/pib/endpoint/search?geoCodes=$geocode&exposeType=$estateType&priceTo=$priceTo&sortBy=$sortBy%3A$sort&pageSize=$limit&pageNumber=$pageNumber');
    List<RealEstateObject> estates = [];
//print("server:  " + sort + "  " + sortBy);

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
  }

  /**
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
  Future<ExposeObject> fetchEstate({String id = "118344311"}) async {
    final response = await http.get(
        'https://pib-prod.is24-baufi.eu-west-1.infinity.s24cloud.net/pib/endpoint/exposes/$id');

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      ExposeObject exposeObject = ExposeObject.fromJson(jsonData);
      return exposeObject;
    } else {
      throw Exception('Something went not right ...');
    }
  }

  /**
   * fetchFavorite()
   * This method takes an string ID as a parameter and fetches an object by its ID
   * For that, the methods sends a HTTP-GET request to the immoscout24 API.
   * The server itself responds back a body-json with the Status Code 200, when the
   * query is succesful.
   * The responded body will then be decoded from a string into a json.
   * This json will be factored into the fields of the class ExposeObject.
   * @param id: String - ID of an estate
   * @returns: RealEstateObject (look in class real_estate_object.dart)
   * @Exception: On Rejected
   */
  Future<RealEstateObject> fetchFavorite({String id = "118344311"}) async {
    final response = await http.get(
        'https://pib-prod.is24-baufi.eu-west-1.infinity.s24cloud.net/pib/endpoint/exposes/$id');

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      RealEstateObject favoriteObject = RealEstateObject.fromJson(jsonData);
      return favoriteObject;
    } else {
      Favorites.savedFavorites.remove(id);
      throw Exception('Something went not right ...');
    }
  }

  /**
   * fetchLength()
   * @params: get geocode: Integer, estateType:String, priceTo: Integer, sortBy: String, pageNumber: Integer
   * @return:Lenght of results list
   */
  Future<ResultsLength> fetchLength ({int geocode = 1276003001,
    String estateType = 'BOTH',
    int priceTo = 100000,
    int pageNumber = 0,
    int limit = 3,
    List<RealEstateObject> estateList}) async {

    final response = await http.get(
        'https://pib-prod.is24-baufi.eu-west-1.infinity.s24cloud.net/pib/endpoint/search?geoCodes=$geocode&exposeType=$estateType&priceTo=$priceTo&sortBy=firstActivationDate%3Adesc&pageSize=$limit&pageNumber=$pageNumber');

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body)['paging'];

        ResultsLength length = ResultsLength.fromJson(jsonData);
        return length;
      } else {
        throw Exception('Something went not right ...');
      }
  }
}
