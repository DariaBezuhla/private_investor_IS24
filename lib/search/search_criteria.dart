import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:investors/results/result_list.dart';
import 'package:investors/search/Location.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';

class SearchCriteria extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchCriteriaState();
}

class SearchCriteriaState extends State<SearchCriteria> {
  static const _BASE_ENDPOINT =
      'https://bhh9vcma76.execute-api.eu-central-1.amazonaws.com/sandbox/';

  Location _selected;

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Private Investors Portal"),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: _buildStack,
          ),
        ),
      );

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final theme = Theme.of(context);

    return Container(
      color: theme.primaryColor,
      child: Stack(
        children: <Widget>[
          Material(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Positioned(
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: SimpleAutocompleteFormField<Location>(
                            itemBuilder: (context, item) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  child: Text(item.label),
                                ),
                            onSearch: _getAutocompleteLocations,
                            onChanged: (it) {
                              setState(() {
                                _selected = it;
                              });
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ),
                          child: CupertinoButton(
                            child: Text(
                              "Search",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                            color: Color(0xE6FF7500),
                            disabledColor: Colors.grey,
                            onPressed: _selected == null
                                ? null
                                : () {
                                    _pushLocation(_selected);
                                  },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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

  void _pushLocation(Location location) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultList(location),
        ),
      );
}
