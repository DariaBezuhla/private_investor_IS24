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

  String _input;
  Timer _timer;

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
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Location",
                    ),
                    keyboardType: TextInputType.text,
                    onChanged: (it) {
                      if (it.length >= 2) {
                        _timer = Timer(
                          const Duration(milliseconds: 500),
                          () {
                            setState(() {
                              _input = it;
                            });
                          },
                        );
                      }
                    },
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: _getAutocompleteLocations(_input),
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
                                snapshot.data as List<Location>,
                                (it) {
                                  Navigator.of(context).pop(it);
                                },
                              ),
                            );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _navigationBar() => CupertinoNavigationBar(
        leading: _navigationButton(
          Text("Cancel", style: TextStyle(fontSize: 16.0)),
          () {
            Navigator.of(context).pop(null);
          },
        ),
        middle: Text("Location", style: TextStyle(fontWeight: FontWeight.bold)),
      );

  Widget _navigationButton(Widget child, VoidCallback onPressed) =>
      CupertinoButton(
        child: child,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
      );

  Future<List<Location>> _getAutocompleteLocations(String search) async {
    if (search == null || search.length < 3) {
      return <Location>[];
    }

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

  Widget _buildListView(
    BuildContext context,
    List<Location> results,
    ValueChanged<Location> onValueChanged,
  ) =>
      ListView.builder(
        itemBuilder: (context, index) {
          final item = results[index];
          return FlatButton(
            onPressed: () {
              onValueChanged(item);
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(item.label),
            ),
          );
        },
        itemCount: results.length,
      );

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
