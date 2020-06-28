import 'package:privateinvestorsmobile/calculator/subjects/additional_costs.dart';
import 'package:http/http.dart' as http;
import 'package:privateinvestorsmobile/calculator/subjects/purchase_price.dart';
import 'dart:async';
import 'dart:convert';



class CalculatorDataService {

  Future<PurchasePrice> fetchPurchasePrice() async {
    final response = await http.get(
        'https://www.immobilienscout24.de/baufinanzierung-api/restapi/api/financing/construction/v1.0/monthlyrate?exposeId=119364885');

    if (response.statusCode == 200) {
      return PurchasePrice.fromJson(json.decode(utf8.decode(response.bodyBytes)));

    } else {
      throw Exception('Server returned bad Request $response');
    }
  }

  Future<AdditionalCosts> fetchAdditionalCosts() async {
    final response = await http.get(
        'https://www.immobilienscout24.de/baufinanzierung-api/restapi/api/financing/construction/v1.0/monthlyrate?exposeId=119364885');

    if (response.statusCode == 200) {
      return AdditionalCosts.fromJson(json.decode(utf8.decode(response.bodyBytes)));

    } else {
      throw Exception('Server returned bad Request $response');
    }
  }


}