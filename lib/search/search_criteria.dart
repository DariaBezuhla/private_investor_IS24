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
  static const __kPickerItemHeight = 32.0;

  Location _location;
  num _yield;
  num _price;
  num _rent;

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            "Private Investors",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
                                child: _criteriaInfo("Net Yield", () {
                                  showCupertinoDialog(
                                    context: context,
                                    builder: (context) => CupertinoAlertDialog(
                                          content: Text("Net Yield"),
                                        ),
                                  );
                                }),
                              ),
                            ),
                            _criteriaValue(context, "from 2.5%", (it) {
                              setState(() {
                                _yield = it;
                              });
                            }),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: _criteriaInfo("Price Trend", () {
                                  showCupertinoDialog(
                                    context: context,
                                    builder: (context) => CupertinoAlertDialog(
                                          content: Text("Price Trend"),
                                        ),
                                  );
                                }),
                              ),
                            ),
                            _criteriaValue(context, "from 3.0%", (it) {
                              setState(() {
                                _price = it;
                              });
                            }),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: _criteriaInfo("Rent Trend", () {
                                  showCupertinoDialog(
                                    context: context,
                                    builder: (context) => CupertinoAlertDialog(
                                          content: Text("Rent Trend"),
                                        ),
                                  );
                                }),
                              ),
                            ),
                            _criteriaValue(context, "from 3.0%", (it) {
                              setState(() {
                                _rent = it;
                              });
                            }),
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
                          disabledColor: CupertinoColors.inactiveGray,
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

  Widget _criteriaValue(
    BuildContext context,
    String data,
    ValueChanged<num> onSelectedValueChanged,
  ) {
    return OutlineButton(
      child: Row(
        children: <Widget>[
          Text(data),
          const SizedBox(width: 8.0),
          const Icon(CupertinoIcons.right_chevron, size: 16.0),
        ],
      ),
      onPressed: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (context) => CupertinoPicker(
                backgroundColor: CupertinoColors.white,
                children: List<Widget>.generate(
                  11,
                  (index) => new Center(
                        child: Text(
                          "${index / 2} %",
                        ),
                      ),
                ),
                itemExtent: __kPickerItemHeight,
                scrollController: FixedExtentScrollController(initialItem: 0),
                onSelectedItemChanged: (index) {
                  onSelectedValueChanged(index / 2);
                },
              ),
        );
      },
    );
  }

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
