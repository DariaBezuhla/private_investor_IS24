import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:privateinvestorsmobile/home/location.dart';

/**
 * The AutoCompleteLocationService class is only responsible for fetching and does not have
 * other instance fields.
 * Each instance of this class can obtain the location results by querying the input 'location'
 * The list of location is necessary for the autocomplete textfield.
 */
class AutoCompleteLocationService {
  AutoCompleteLocationService(){}

  /**
   * fetchAutocompleteLocation()
   * This method takes a String query 'location' and looks for entries in the database which matches with the input.
   * The method makes a GET HTTP-request to Private Investors API. The API itself returns a response to the app.
   * The json-respons then needs to be decoded, afterwards, the decoded JSON objects will be added to a List of Location.
   * This list will be returned after the promise is fullfilled.
   * Otherwise, the method returns an Exception.
   * @param String: location = The location
   * @returns List<Location>
   * @Exception Exception
   */
  Future<List<Location>> fetchAutocompleteLocation ({String location = 'berlin'}) async {
    final response = await http.get(
        'https://pib-prod.is24-baufi.eu-west-1.infinity.s24cloud.net/pib/endpoint/geo-auto-complete?t=country%2Cregion%2Ccity%2Cdistrict%2Cpostcode%2CquarterOrTown%2CpostcodeWithQuarter&i=$location'
    );

    List<Location> locations = [];
    if (response.statusCode == 200) {
      var cities = json.decode(utf8.decode(response.bodyBytes))['city']; // possibly list
      var postcodes = json.decode(utf8.decode(response.bodyBytes))['postcode']; // List
      var quarterOrTowns = json.decode(utf8.decode(response.bodyBytes))['quarterOrTown']; // definietely list
      var countries = json.decode(utf8.decode(response.bodyBytes))['country'];

      if (cities != null) {
        for (var city in cities) {
          locations.add(Location.fromJson(city));
        }
      }
//
      if (postcodes != null) {
        for (var postcode in postcodes) {
          locations.add(Location.fromJson(postcode));
        }
      }

      if (quarterOrTowns != null) {
        for (var qOrT in quarterOrTowns) {
          locations.add(Location.fromJson(qOrT));
        }
      }

      if (countries != null) {
        for (var country in countries) {
          locations.add(Location.fromJson(country));
        }
      }

      return locations;
    } else {
      throw Exception('Something went wrong . . .');
    }
  }
}