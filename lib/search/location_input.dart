import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:investors/search/location.dart';

class LocationInput extends StatefulWidget {
  @override
  State createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  static const _BASE_ENDPOINT =
      'https://bhh9vcma76.execute-api.eu-central-1.amazonaws.com/sandbox/';
  static const _BOLD = TextStyle(fontWeight: FontWeight.bold);

  var _location;

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        navigationBar: _navigationBar(),
        child: SafeArea(
          child: Material(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    focusNode: FocusNode(),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget _navigationBar() => CupertinoNavigationBar(
        leading: _navigationButton(Text("Cancel"), () {
          Navigator.of(context).pop(false);
        }),
        middle: Text("Location", style: _BOLD),
        trailing: _navigationButton(
          Text("Done", style: _BOLD),
          _location == null
              ? null
              : () {
                  Navigator.of(context).pop(_location);
                },
        ),
      );

  Widget _navigationButton(Widget child, VoidCallback onPressed) =>
      CupertinoButton(
        child: child,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
      );

  Future<List<Location>> _getAutocompleteLocations(String search) async {
    final response = await get(
        '$_BASE_ENDPOINT/geo-auto-complete?t=quarterOrTown&i=$search');

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((it) => Location.fromJson(it['entity']))
          .toList();
    } else {
      throw Exception('Failed to load locations');
    }
  }
}
