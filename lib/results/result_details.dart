import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:investors/network/scout_client.dart';
import 'package:investors/results/expose.dart';
import 'package:transparent_image/transparent_image.dart';

class ResultDetails extends StatefulWidget {
  final String _id;

  ResultDetails(this._id);

  @override
  State<StatefulWidget> createState() => _ResultDetailsState(_id);
}

class _ResultDetailsState extends State<ResultDetails> {
  static const _BASE_ENDPOINT = "api.mobile.immobilienscout24.de";

  final ScoutClient _client = ScoutClient();
  final String _id;

  _ResultDetailsState(this._id);

  @override
  Widget build(BuildContext context) => FutureBuilder<Expose>(
        future: _getExposeDetails(_id),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Stack(
                children: <Widget>[
                  Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ],
              );
            default:
              if (snapshot.hasError)
                return Text("Error: ${snapshot.error}");
              else
                return FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: snapshot.data.picture,
                  fit: BoxFit.cover,
                );
          }
        },
      );

  Future<Expose> _getExposeDetails(String id) async {
    final response = await _client.token.then(
      (token) => get(
            "https://$_BASE_ENDPOINT/expose/$id",
            headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
          ),
    );

    if (response.statusCode == 200) {
      return Expose.fromJson(json.decode(response.body));
    } else {
      return Future.error(Exception('Failed to load expose details'));
    }
  }
}
