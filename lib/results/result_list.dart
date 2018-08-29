import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:investors/results/expose.dart';
import 'package:investors/search/Location.dart';
import 'package:transparent_image/transparent_image.dart';

class ResultList extends StatefulWidget {
  final Location _location;

  ResultList(this._location);

  @override
  State<StatefulWidget> createState() => ResultListState(_location);
}

class ResultListState extends State<ResultList> {
  static const _BASE_ENDPOINT =
      'https://bhh9vcma76.execute-api.eu-central-1.amazonaws.com/sandbox/';

  final List<Expose> results = <Expose>[];
  final Location _location;

  ResultListState(this._location);

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Results for ${_location.label}"),
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
                        snapshot.data as List<Expose>,
                      ),
                    );
              }
            },
          ),
        ),
      );

  Widget _buildListView(BuildContext context, List<Expose> results) =>
      ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) => Column(
              children: <Widget>[
                _buildRow(results[index]),
                Divider(height: 2.0),
              ],
            ),
      );

  Widget _buildRow(Expose expose) {
    return Row(children: <Widget>[
      Container(
        width: 120.0,
        height: 50.0,
        child: Stack(
          children: <Widget>[
            Center(child: CupertinoActivityIndicator()),
            Center(child: _getPicture(expose.picture))
          ],
        ),
      ),
      Flexible(
        child: Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              expose.title,
              overflow: TextOverflow.ellipsis,
            )),
      ),
    ]);
  }

  Widget _getPicture(Picture picture) {
    if (picture.scales.isEmpty) {
      return Image.asset(
        "assets/noimage.jpg",
        fit: BoxFit.cover,
        width: 120.0,
        height: 50.0,
      );
    }

    final scale = picture.scales
        .firstWhere((it) => it.scale == "SCALE_AND_CROP")
        .href
        .replaceAll("%WIDTH%x%HEIGHT%", "120x50");

    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: scale,
      fit: BoxFit.cover,
    );
  }

  Future<List<Expose>> _getExposeResults(String geocode) async {
    final response = await get(
        '$_BASE_ENDPOINT/search?realestatetype=HOUSEBUY&geocodes=$geocode');

    if (response.statusCode == 200) {
      return (json.decode(response.body)['resultlist.resultlist']
              ['resultlistEntries'][0]['resultlistEntry'] as List)
          .map((it) => Expose.fromJson(it['resultlist.realEstate']))
          .toList();
    } else {
      throw Exception('Failed to load expose results for geocode $geocode');
    }
  }
}
