import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investors/results/result_list.dart';
import 'package:investors/search/location.dart';
import 'package:investors/search/location_input.dart';

class SearchCriteria extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchCriteriaState();
}

class _SearchCriteriaState extends State<SearchCriteria> {
  Location _location;

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Private Investors Portal"),
        ),
        child: SafeArea(
          child: Material(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: OutlineButton(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(_location != null
                                      ? _location.label
                                      : "Location"),
                                ),
                                onPressed: _pushLocation,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: _criteriaInfo("Net Yield", () {}),
                              ),
                            ),
                            _criteriaValue("from 2.5%", () {}),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: _criteriaInfo("Price Trend", () {}),
                              ),
                            ),
                            _criteriaValue("from 3.0%", () {}),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: _criteriaInfo("Rent Trend", () {}),
                              ),
                            ),
                            _criteriaValue("from 3.0%", () {}),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 12.0,
                        ),
                        child: CupertinoButton(
                          child: const Text("Search"),
                          color: const Color(0xE6FF7500),
                          disabledColor: Colors.grey,
                          onPressed: _location == null
                              ? null
                              : () {
                                  _pushResults(_location);
                                },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget _criteriaInfo(String data, VoidCallback onPressed) => FlatButton(
        child: Row(
          children: <Widget>[
            Text(data),
            const SizedBox(width: 8.0),
            const Icon(CupertinoIcons.info, size: 16.0),
          ],
        ),
        onPressed: onPressed,
      );

  Widget _criteriaValue(String data, VoidCallback onPressed) => OutlineButton(
        child: Row(
          children: <Widget>[
            Text(data),
            const SizedBox(width: 8.0),
            const Icon(CupertinoIcons.right_chevron, size: 16.0),
          ],
        ),
        onPressed: onPressed,
      );

  void _pushLocation() async {
    final route = CupertinoPageRoute<Location>(
      builder: (context) => LocationInput(),
    );

    _location = await Navigator.push(context, route);
  }

  void _pushResults(Location location) => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => ResultList(location),
        ),
      );
}
