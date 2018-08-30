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
  static const _kPickerSheetHeight = 216.0;
  static const _kPickerItemHeight = 32.0;

  Location _location;
  num _yield = 2.5;
  num _price = 3.0;
  num _rent = 3.0;

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
                                  child: _location == null
                                      ? Text(
                                          "Location",
                                          style: TextStyle(
                                            color: CupertinoColors.inactiveGray,
                                          ),
                                        )
                                      : Text(_location.label),
                                ),
                                borderSide: BorderSide(
                                  color: CupertinoColors.lightBackgroundGray,
                                  width: 1.0,
                                ),
                                onPressed: _pushLocation,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.0),
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
                            _criteriaValue(
                              context,
                              "from $_yield%",
                              _yield,
                              (it) {
                                setState(() {
                                  _yield = it;
                                });
                              },
                            ),
                          ],
                        ),
                        Divider(),
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
                            _criteriaValue(
                              context,
                              "from $_price%",
                              _price,
                              (it) {
                                setState(() {
                                  _price = it;
                                });
                              },
                            ),
                          ],
                        ),
                        Divider(),
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
                            _criteriaValue(
                              context,
                              "from $_rent%",
                              _rent,
                              (it) {
                                setState(() {
                                  _rent = it;
                                });
                              },
                            ),
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
            const Icon(CupertinoIcons.info, size: 22.0),
          ],
        ),
        onPressed: onPressed,
      );

  Widget _criteriaValue(
    BuildContext context,
    String data,
    num selected,
    ValueChanged<num> onSelectedValueChanged,
  ) {
    return FlatButton(
      child: Row(
        children: <Widget>[
          Text(data),
          const SizedBox(width: 8.0),
          const Icon(CupertinoIcons.right_chevron, size: 22.0),
        ],
      ),
      onPressed: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (context) => Container(
                height: _kPickerSheetHeight,
                color: CupertinoColors.white,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 22.0,
                  ),
                  child: SafeArea(
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                        initialItem: (selected * 2).toInt(),
                      ),
                      itemExtent: _kPickerItemHeight,
                      backgroundColor: CupertinoColors.white,
                      onSelectedItemChanged: (index) {
                        onSelectedValueChanged(index / 2);
                      },
                      children: List<Widget>.generate(10, (index) {
                        return Center(child: Text("${index / 2} %"));
                      }),
                    ),
                  ),
                ),
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
