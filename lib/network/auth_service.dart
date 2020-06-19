import 'package:http/http.dart' as http;


import 'dart:async';
import 'dart:convert';

class AuthService {
  AuthService(){}

  Future<dynamic> authLogin({String username, String password}) async {
    final response = await http.post(
      'ENDPOINT::AUTHLOGIN',
      headers: <String, String> {
        'Content-Type': 'application/json'
      },
      body: jsonEncode(<String, String> {
        'username': username,
        'password': password
      }),
    );
  }

  Future<dynamic> registrate({
    String username,
    String password,
    String email
  }) async
  {
    final response = await http.post(
      'ENDPOINT::REGISTRATE',
      headers: <String, String> {
        'Content-Type': 'application/json'
      },
      body: jsonEncode(<String, String> {
        'username': username,
        'password': password
      }),
    );
  }
}