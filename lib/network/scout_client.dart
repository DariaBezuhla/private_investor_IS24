import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

class ScoutClient {
  static final ScoutClient _instance = ScoutClient.internal();

  static const _CLIENT_ID = "PRIVATE-INVESTORS-MOBILE";

  Future<String> token = post(
    "https://publicauth.immobilienscout24.de/oauth/token",
    body: {
      'grant_type': 'client_credentials',
      'client_id': _CLIENT_ID,
    },
  ).then((it) => json.decode(it.body)['access_token']);

  factory ScoutClient() => _instance;

  ScoutClient.internal();
}
