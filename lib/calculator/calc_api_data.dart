import 'package:http/http.dart' as http;
import 'package:privateinvestorsmobile/calculator/subjects/calculator_api_data_object.dart';
import 'dart:async';
import 'dart:convert';



class CalculatorDataService {

  Future<CalculatorAPIData> fetchAPIData() async {
    final response = await http.get(
        'https://www.immobilienscout24.de/baufinanzierung-api/restapi/api/financing/construction/v1.0/monthlyrate?exposeId=119364885');

    if (response.statusCode == 200) {
      return CalculatorAPIData.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Server returned bad Request $response');
    }
  }

}