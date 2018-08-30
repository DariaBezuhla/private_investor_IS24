import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:investors/network/scout_client.dart';
import 'package:investors/results/result_item.dart';
import 'package:investors/results/summary.dart';
import 'package:investors/search/location.dart';

class ResultList extends StatefulWidget {
  final Location _location;

  ResultList(this._location);

  @override
  State<StatefulWidget> createState() => ResultListState(_location);
}

class ResultListState extends State<ResultList> {
  static const _BASE_ENDPOINT = 'api.mobile.immobilienscout24.de';

  final Location _location;

  ScoutClient get _client => ScoutClient();
  num _page = 1;

  ResultListState(this._location);

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Results for $_location"),
        ),
        child: SafeArea(
          child: FutureBuilder(
            future: _getExposeResults(_location.id),
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
                    return Material(
                      child: _buildListView(
                        context,
                        snapshot.data as List<Summary>,
                      ),
                    );
              }
            },
          ),
        ),
      );

  Widget _buildListView(BuildContext context, List<Summary> results) =>
      ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) => Column(
              children: <Widget>[
                ResultItem(results[index]),
                Divider(height: 2.0),
              ],
            ),
      );

  Future<List<Summary>> _getExposeResults(String geocode) async {
    final response = await _client.token.then(
      (token) => get(
            "https://$_BASE_ENDPOINT/search?" +
                "searchType=region&" +
                "realestatetype=apartmentbuy&" +
                "geocodes=$geocode&" +
                "pagesize=10&" +
                "pagenumber=$_page",
            headers: {
              HttpHeaders.authorizationHeader: "Bearer $token",
            },
          ),
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body)['results'] as List;
      return result.map((it) => Summary.fromJson(it)).toList();
    } else {
      return Future.error(
          Exception('Failed to load expose results for geocode $geocode'));
    }
  }
}
