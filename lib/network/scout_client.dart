import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

class ScoutClient {
  static const _CLIENT_ID = "AndroidApp-QuickCheckKey";
  static const _CLIENT_SECRET = "1Wg0YZtnQQZCntxN";

  Future<String> token = post(
    "https://publicauth.immobilienscout24.de/oauth/token",
    body: {
      'grant_type': 'client_credentials',
      'client_id': _CLIENT_ID,
      'client_secret': _CLIENT_SECRET,
    },
  ).then((it) => json.decode(it.body)['access_token']);
}
