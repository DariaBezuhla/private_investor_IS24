import 'package:http/http.dart' as http;
import 'package:privateinvestorsmobile/calculator/subjects/calculator_api_data_object.dart';
import 'dart:async';
import 'dart:convert';



class CalculatorDataService {

  CalculatorDataService() {}

  /**
   * Method name : fetchAPIData
   * @params:
   * @return:
   */

  Future<CalculatorAPIData> fetchAPIData({String exposeId}) async {
    final response = await http.get(
        'https://www.immobilienscout24.de/baufinanzierung-api/restapi/api/financing/construction/v1.0/monthlyrate?exposeId=$exposeId');

    if (response.statusCode == 200) {
      return CalculatorAPIData.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Server returned bad Request $response');
    }
  }

}